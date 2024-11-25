# Persian Classical Music Instrument Recognition (PCMIR) Using a Novel Persian Music Database

This repository is dedicated to the implementation and study of **Persian Classical Music Instrument Recognition (PCMIR)**, based on the research paper:

> **Persian Classical Music Instrument Recognition (PCMIR) Using a Novel Persian Music Database**
> 
<div align="justify">
The goal of this project is to classify Persian classical musical instruments using advanced feature extraction, feature selection, and classification techniques. This repository showcases the innovative approach outlined in the paper.
</div>

- ### Please Cite:
- Mousavi, Seyed Muhammad Hossein, VB Surya Prasath, and Seyed Muhammad Hassan Mousavi. "Persian classical music instrument recognition (PCMIR) using a novel Persian music database." 2019 9th International Conference on Computer and Knowledge Engineering (ICCKE). IEEE, 2019.
- ### Link to the Paper:
- https://ieeexplore.ieee.org/abstract/document/8965166
- ### Link to the Dataset:
- https://www.kaggle.com/datasets/hosseinmousavi/pcmir-database
---

## 📖 Abstract

Audio signal classification is an important domain in pattern recognition and signal processing. Musical instrument classification, a subset of this field, faces unique challenges due to the diverse characteristics of different instruments. This research focuses on the automatic classification of **Persian classical musical instruments** using a combination of extracted audio features. The system is designed to assist in educational and artistic settings, especially in Persian music studies.
![image](https://github.com/user-attachments/assets/d0bab1d9-0f72-4732-8ca5-9082c02e95c3)

The database includes recordings of seven Persian classical instruments:
- **Ney**
- **Tar**
- **Santur**
- **Kamancheh**
- **Tonbak**
- **Ud**
- **Setar**
![image](https://github.com/user-attachments/assets/54ecb81b-8519-4e3c-8e7f-325450fce269)

The classification methodology involves extracting audio features like:
- **Mel-Frequency Cepstral Coefficients (MFCCs)**
- **Spectral Roll-off**
- **Spectral Centroid**
- **Zero Crossing Rate (ZCR)**
- **Entropy Energy**

These features are refined using **Fuzzy Entropy** for feature selection and classified using **Multi-Layer Neural Networks (MLNN)**.
![image](https://github.com/user-attachments/assets/2fa76d4b-ff9a-49e8-b97e-27bea2f07a57)

---

## 🎯 Objectives

1. **Database Creation**: Development of a novel database for Persian classical musical instruments.
2. **Feature Extraction**: Utilization of spatial and frequency domain features to characterize audio signals.
3. **Feature Selection**: Implementation of **Fuzzy Entropy** to identify the most relevant features.
4. **Classification**: Leveraging MLNN for instrument classification.
5. **Performance Evaluation**: Achieving robust classification results for educational and artistic use cases.

---

## 🗂️ Dataset

A unique Persian music database was created for this research. The dataset includes:
- **7 Instrument Classes**: Ney, Tar, Santur, Kamancheh, Tonbak, Ud, Setar.
- **Audio Samples**: Each class contains 89–110 samples, each 5–10 seconds long.
- **Recording Environment**: Audio was recorded in various environments such as rooms, music shops, and studios.
- **File Format**: MP3.
- ### Link to the Dataset:
- https://www.kaggle.com/datasets/hosseinmousavi/pcmir-database
### Sample Details:

| Instrument   | Samples | Duration (sec) | Recording Environment          |
|--------------|---------|----------------|---------------------------------|
| Ney          | 102     | 5–10           | Closed and Open Spaces          |
| Tar          | 96      | 5–10           | Closed and Open Spaces          |
| Santur       | 107     | 5–10           | Closed and Open Spaces          |
| Kamancheh    | 101     | 5–10           | Closed and Open Spaces          |
| Tonbak       | 110     | 5–10           | Closed and Open Spaces          |
| Setar        | 89      | 5–10           | Closed and Open Spaces          |
| Ud           | 93      | 5–10           | Closed and Open Spaces          |

![image](https://github.com/user-attachments/assets/dff041d2-aca3-4b7c-a22c-2c547920453f)

---

## 🛠️ Methodology

1. **Audio Preprocessing**:
   - Normalize audio signals to ensure uniformity.
2. **Feature Extraction**:
   - Extracted five key features from each audio sample:
     - **MFCCs**
     - **Spectral Roll-off**
     - **Spectral Centroid**
     - **Zero Crossing Rate**
     - **Entropy Energy**
3. **Feature Selection**:
   - Applied **Fuzzy Entropy** to identify and retain the most significant features for classification.
4. **Classification**:
   - Trained a **Multi-Layer Neural Network (MLNN)** for instrument classification.
5. **Evaluation**:
   - Validation using confusion matrix and classification accuracy.

![image](https://github.com/user-attachments/assets/ae56dbd6-2479-4aef-9c27-5a4acbd6d783)

---

## 📊 Results

The proposed method demonstrated promising results:
- **Overall Accuracy**: 82.57%
- **Highest Accuracy**: 95% for **Tonbak** (Percussion instrument)
- **Lowest Accuracy**: 70% for **Ud**

| Instrument   | Accuracy |
|--------------|----------|
| Ney          | 89%      |
| Tar          | 79%      |
| Santur       | 82%      |
| Kamancheh    | 87%      |
| Tonbak       | 95%      |
| Setar        | 76%      |
| Ud           | 70%      |

---

## 🔍 Future Work

The research suggests the following improvements:
1. Incorporating additional features such as **Spectral Flux**, **Spectral Spread**, and **Short Time Energy**.
2. Expanding the database to include all 11 Persian classical instruments.
3. Enhancing classification accuracy using **Deep Learning models** such as **Autoencoders**.
4. Applying the system in real-world settings for Persian music education and preservation.

---

## 📜 Citation

If you use this project or find it helpful, please cite the original paper:

```bibtex
@inproceedings{mousavi2019persian,
  title={Persian classical music instrument recognition (PCMIR) using a novel Persian music database},
  author={Mousavi, Seyed Muhammad Hossein and Prasath, VB Surya and Mousavi, Seyed Muhammad Hassan},
  booktitle={2019 9th International Conference on Computer and Knowledge Engineering (ICCKE)},
  pages={122--130},
  year={2019},
  organization={IEEE}
}

- ### DOI:
- https://doi.org/10.1109/ICCKE48569.2019.8965166


