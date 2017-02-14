/*
 * File:   filesystem.c
 * Author: Michael Vincent
 *
 * Created on 25 novembre 2015, 09:20
 */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <malloc.h>

const int NBPARAMETRE = 1;

int
validationNombreDeParametre (int nombreDeParametre, const char* fichierExecution)
{
  if (nombreDeParametre != 2)
    {
      fprintf (stderr, "Usage: %s [nom_du_fichier_d_entree] [nom_du_fichier_de_sortie]\n", fichierExecution);
      exit (EXIT_FAILURE);
    }
  return EXIT_SUCCESS;
}

int
ouvertureFichier (FILE *fichierAOuvrir, char* cheminFichier, char* droitAcces)
{
  fichierAOuvrir = fopen (cheminFichier, droitAcces);
  if (!fichierAOuvrir)
    {
      fprintf (stderr, "Erreur: %s\n", strerror (errno));
      exit (EXIT_FAILURE);
    }
  return EXIT_SUCCESS;
}


int main(int argc, char const *argv[]) {
  FILE *file = NULL;
  char *filename;
  validationNombreDeParametre(NBPARAMETRE, argv[0]);
  ouvertureFichier(file, filename, "wb");
  return 0;
}
