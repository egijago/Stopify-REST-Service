/*
  Warnings:

  - Added the required column `idGenre` to the `LikeTo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idGenre` to the `ListenTo` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "LikeTo" ADD COLUMN     "idGenre" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ListenTo" ADD COLUMN     "idGenre" INTEGER NOT NULL;
