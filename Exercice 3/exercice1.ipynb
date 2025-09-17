#!/usr/bin/env python3

#-------------------------------------------------------------------------------
# Modules
#-------------------------------------------------------------------------------
import numpy as np
import cv2 as cv
from google.colab.patches import cv2_imshow
import matplotlib.pylab as plt
from sklearn.model_selection import train_test_split
from sklearn import svm
import tensorflow as tf

#-------------------------------------------------------------------------------
# Fonctions utilitaires
#-------------------------------------------------------------------------------
def apply_transform( p, fd=[1.0,1.0], theta=0.0, t=[0,0] ):
    """
    Fonction appliquant une transformation affine à un nuage de points 2D
    @p     : matrice à n lignes et 2 colonnes contenant les coordonnées des points du nuage
    @fd    : vecteur à deux entrées contenant les facteurs de dilatations en x et y du nuage
    @theta : angle de rotation (en degrés) appliqué au nuage
    @t     : vecteur à deux entrées contenant les translations en x et y du nuage
    """
    theta2 = np.deg2rad(theta)
    R = np.array([[fd[0]*np.cos(theta2),fd[0]*np.sin(theta2)], [-fd[1]*np.sin(theta2),fd[1]*np.cos(theta2)], [t[0],t[1]]])
    A = np.hstack((p,np.ones((p.shape[0],1))))
    return A@R

#-------------------------------------------------------------------------------
# Code programme principal
#-------------------------------------------------------------------------------
# Paramètres
nb_points   = 50      # nombre d'observations dans chaque classe
test_size   = 0.1     # Taille (en %) de l'échantillon de test
C           = 0.0001  # Paramètre de régularisaton des SVMs
xmin, xmax  = -15, 15 # Valeurs min/max pour le tracé en abiscisse
ymin, ymax  = -15, 15 # Valeurs min/max pour le tracé en ordonnée
figure_size = (8,8)   # Taille des figures
seed        = 150     # Valeur de la graine (expériences reproductibles si >0)

# On vérifie d'abord si le GPU est disponible
if tf.test.gpu_device_name() != '/device:GPU:0':
  raise SystemError('GPU device not found. Please configure the notebook to use it)')

# Gestion facilitée de figures multiples
plt.ion()

# On fixe la graine (reproductibilité)
if seed>0:
  np.random.seed(seed)

# On génère les données de la classe 1
c1d = apply_transform(np.random.randn(nb_points,2), [3,1.5], -20, [0,0])

# On génère les données de la classe 2
c2d1 = apply_transform(np.random.randn(int(np.floor(nb_points/4)),2), [1,1], 0, [-10,4])
c2d2 = apply_transform(np.random.randn(int(np.floor(nb_points/4)),2), [1,1], 0, [-7,-2])
c2d3 = apply_transform(np.random.randn(int(np.floor(nb_points/4)),2), [1,1], 0, [-2,-6])
c2d4 = apply_transform(np.random.randn(int(nb_points-3*np.floor(nb_points/4)),2), [1,1], 0, [5,-7])

# On rassemble les données des deux classes
data = np.vstack((c1d, c2d1, c2d2, c2d3, c2d4))

# On génère les étiquettes (labels) de chaque classe
l1c = np.ones(nb_points, dtype=int)
l2c = np.zeros(nb_points, dtype=int)
labels = np.hstack((l1c, l2c))

# On sépare les données en deux ensembles : apprentissage et test
X_train, X_test, y_train, y_test = train_test_split(data, labels, test_size=test_size, random_state=seed)

# On entraîne un modèle SVM sur les données d'apprentissage
model = svm.SVC(kernel='linear', C=C)
model.fit(X_train, y_train)

# On visualise la classification sur les données d'apprentissage
cmp1 = np.array(['r','b'])
nx, ny = 1000, 1000
xx, yy = np.meshgrid(np.linspace(xmin, xmax, nx),np.linspace(ymin, ymax, ny))
zz = model.predict(np.c_[xx.ravel(),yy.ravel()])
zz = zz.reshape(xx.shape)
plt.figure(figsize=figure_size)
plt.contour(xx, yy, zz, [0.5])
plt.scatter(X_train[:,0], X_train[:,1], marker='o', c=cmp1[y_train], s=50, edgecolors='none')
plt.xlim([xmin,xmax])
plt.ylim([ymin,ymax])
plt.grid()
plt.title("Classification sur les données d'apprentissage")
plt.xlabel('Variable 1')
plt.ylabel('Variable 2')
plt.gca().set_aspect('equal')
plt.show()

# On visualise la classification sur les données de test
cmp2 = np.array(['r','b'])
nx, ny = 1000, 1000
xx, yy = np.meshgrid(np.linspace(xmin, xmax, nx),np.linspace(ymin, ymax, ny))
zz = model.predict(np.c_[xx.ravel(),yy.ravel()])
zz = zz.reshape(xx.shape)
plt.figure(figsize=figure_size)
plt.contour(xx, yy, zz, [0.5])
plt.scatter(X_test[:,0], X_test[:,1], marker='o', c=cmp1[y_test], s=50, edgecolors='none')
plt.xlim([xmin,xmax])
plt.ylim([ymin,ymax])
plt.grid()
plt.title("Classification sur les données de test")
plt.xlabel('Variable 1')
plt.ylabel('Variable 2')
plt.gca().set_aspect('equal')
plt.show()
