#!/usr/bin/env python3

#-------------------------------------------------------------------------------
# Modules
#-------------------------------------------------------------------------------
import numpy as np
import cv2 as cv
from google.colab.patches import cv2_imshow
import matplotlib.pylab as plt
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn import svm
from sklearn.metrics import confusion_matrix
from keras.models import Sequential
from keras.layers import Input, Dense, Activation, Conv2D, Flatten, MaxPooling2D, Dropout
from keras.models import model_from_json
import skimage

#-------------------------------------------------------------------------------
# Fonctions utilitaires
#-------------------------------------------------------------------------------
def save_model( model, filename ):
  """
  Fonction de sauvegarde d'un modèle Keras (fichiers d'extension json et h5)
  @model    : modèle Keras
  @filename : nom de fichier
  """
  # Export au format JSON
  model_json = model.to_json()
  with open(filename+".json", "w") as json_file:
    json_file.write(model_json)

  # Export au format HDF5
  model.save_weights(filename+".h5")

def load_model( filename ):
  """
  Fonction de chargement d'un modèle Keras (fichiers d'extension json et h5)
  Attention, le modèle a besoin d'être compilé avant toute utilisation
  @model    : modèle Keras
  @filename : nom de fichier
  """
  # Charge le fichier JSON and et crée le modèle
  json_file = open(filename+".json", 'r')
  loaded_model_json = json_file.read()
  json_file.close()
  loaded_model = model_from_json(loaded_model_json)

  # Charge les poids dans le modèle
  loaded_model.load_weights(filename+".h5")

  return loaded_model

def get_confusion_matrix( x, model, y_true ):
  """
  Fonction retournant la matrice de confusion
  @x      : données à classifier (matrice à n lignes et 10 colonnes)
  @model  : classifieur permettant de réaliser des prédictions
  @y_true : vraies étiquettes (vecteur à n entrées)
  """
  y_pred = model.predict(x)
  y_true2 = np.argmax(y_true, axis=1)
  y_pred2 = np.argmax(y_pred, axis=1)
  m = confusion_matrix(y_true2, y_pred2)
  return m

#-------------------------------------------------------------------------------
# Code programme principal
#-------------------------------------------------------------------------------
# Paramètres
nb_classes  = 10      # Nombre de chiffres à reconnaître
image_size  = 28      # Taille des images de chiffres
test_size   = 0.33    # Taille (en %) de l'échantillon de test
figure_size = (8,8)   # Taille des figures
seed        = 150     # Valeur de la graine (expériences reproductibles si >0)
batch_size  = 300     # Nombre d'exemples utilisés pour calculer le gradient (>0)
nb_epochs   = 10      # Nombre de passages sur la totalité des données d'apprentissage

# On vérifie d'abord si le GPU est disponible
if tf.test.gpu_device_name() != '/device:GPU:0':
  raise SystemError('GPU device not found. Please configure the notebook to use it)')

# Gestion facilitée de figures multiples
plt.ion()

# On fixe la graine (reproductibilité)
if seed>0:
  np.random.seed(seed)

# On récupère les données d'apprentissage et de test
(X_train, y_train), (X_test, y_test) = tf.keras.datasets.mnist.load_data()

# On vectorise et normalise les données du dataset
X_train = X_train.reshape(X_train.shape[0], image_size**2).astype('float32')/255
X_test  = X_test.reshape(X_test.shape[0], image_size**2).astype('float32')/255

# Conversion des variables de sortie (one hot encoding)
y_train = tf.keras.utils.to_categorical(y_train, nb_classes)
y_test  = tf.keras.utils.to_categorical(y_test, nb_classes)

# On construit le réseau
model = Sequential()
model.add(Input(shape=image_size**2))
model.add(Dense(nb_classes, activation='softmax'))

# On compile et entraîne le réseau
model.compile(loss='categorical_crossentropy', optimizer='adam', metrics=['accuracy'])
model.fit(X_train, y_train, batch_size=batch_size, epochs=nb_epochs, verbose=1)

# On affiche la performance
# ...
