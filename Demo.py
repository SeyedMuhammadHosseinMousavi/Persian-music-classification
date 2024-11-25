import os
import numpy as np
import librosa
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
from sklearn.decomposition import PCA
from sklearn.impute import SimpleImputer
from sklearn.metrics import classification_report, confusion_matrix
from xgboost import XGBClassifier
import pandas as pd

# Step 1: Load Data with Progress Tracking
def load_data(data_dir):
    print("Loading data from:", data_dir)
    features = []
    labels = []
    for instrument in os.listdir(data_dir):
        instrument_path = os.path.join(data_dir, instrument)
        if os.path.isdir(instrument_path):
            print(f"Processing instrument: {instrument}")
            for file in os.listdir(instrument_path):
                if file.endswith('.mp3'):
                    file_path = os.path.join(instrument_path, file)
                    print(f"  Loading file: {file}")
                    try:
                        # Load audio file
                        y, sr = librosa.load(file_path, sr=None)
                        print("    Audio loaded. Performing normalization and feature extraction...")

                        # Feature extraction
                        mfccs = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
                        spectral_rolloff = librosa.feature.spectral_rolloff(y=y, sr=sr)
                        spectral_centroid = librosa.feature.spectral_centroid(y=y, sr=sr)
                        zcr = librosa.feature.zero_crossing_rate(y=y)
                        entropy_energy = -np.sum(
                            np.log(np.abs(y)) * np.abs(y)
                        ) / len(y)

                        # Combine features
                        feature_vector = np.concatenate([
                            np.mean(mfccs, axis=1),
                            np.mean(spectral_rolloff, axis=1),
                            np.mean(spectral_centroid, axis=1),
                            np.mean(zcr, axis=1),
                            [entropy_energy]
                        ])
                        features.append(feature_vector)
                        labels.append(instrument)
                        print("    Features extracted and added to dataset.")
                    except Exception as e:
                        print(f"    Error processing file {file}: {e}")
    print("Data loading complete.")
    return np.array(features), np.array(labels)

# Step 2: Prepare Data
def prepare_data(data_dir, n_pca_components):
    print("Preparing data...")
    X, y = load_data(data_dir)
    print(f"Total samples: {X.shape[0]}, Feature size: {X.shape[1]}")
    
    # Handle missing values
    print("Handling missing values in the feature set...")
    imputer = SimpleImputer(strategy="mean")
    X = imputer.fit_transform(X)

    # Encode labels
    label_encoder = LabelEncoder()
    y_encoded = label_encoder.fit_transform(y)
    print(f"Labels encoded. Classes: {label_encoder.classes_}")

    # PCA for feature selection
    print(f"Applying PCA to reduce features to {n_pca_components} components...")
    pca = PCA(n_components=n_pca_components)
    X_pca = pca.fit_transform(X)
    print(f"PCA complete. Transformed feature size: {X_pca.shape[1]}")

    # Split into train and test sets
    X_train, X_test, y_train, y_test = train_test_split(X_pca, y_encoded, test_size=0.7, random_state=42)
    print("Data split into training and testing sets.")
    return X_train, X_test, y_train, y_test, label_encoder, X, y

# Step 3: Train XGBoost Classifier
def train_xgboost(X_train, y_train):
    print("Training XGBoost classifier...")
    model = XGBClassifier(use_label_encoder=False, eval_metric='mlogloss')
    model.fit(X_train, y_train)
    print("Training complete.")
    return model

# Step 4: Evaluate Model
def evaluate_model(model, X_test, y_test, label_encoder):
    print("Evaluating model on test data...")
    y_pred = model.predict(X_test)
    print("Classification Report:")
    report = classification_report(y_test, y_pred, target_names=label_encoder.classes_)
    print(report)
    print("Confusion Matrix:")
    matrix = confusion_matrix(y_test, y_pred)
    print(matrix)

# Step 5: Full Pipeline
def full_pipeline(data_dir, n_pca_components=20):
    print("Starting full pipeline...")
    X_train, X_test, y_train, y_test, label_encoder, X, y = prepare_data(data_dir, n_pca_components)
    model = train_xgboost(X_train, y_train)
    evaluate_model(model, X_test, y_test, label_encoder)

    # Save extracted features and labels for variable explorer
    extracted_features = pd.DataFrame(X, columns=[f"Feature_{i+1}" for i in range(X.shape[1])])
    extracted_features['Label'] = y
    print("Returning extracted features for Spyder variable explorer...")
    return extracted_features

# Specify the data directory and number of PCA components
data_dir = 'PCMIR Small'
n_pca_components = 15  # Set the desired number of PCA components

# Run the pipeline
extracted_features = full_pipeline(data_dir, n_pca_components)
