/*
  Warnings:

  - Added the required column `idUser` to the `ListenTo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "ListenTo" ADD COLUMN     "idUser" INTEGER NOT NULL;
