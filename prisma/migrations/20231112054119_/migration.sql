/*
  Warnings:

  - The primary key for the `LikeTo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `date` on the `LikeTo` table. All the data in the column will be lost.
  - You are about to drop the column `titleAlbum` on the `LikeTo` table. All the data in the column will be lost.
  - You are about to drop the column `titleMusic` on the `LikeTo` table. All the data in the column will be lost.
  - You are about to drop the column `date` on the `ListenTo` table. All the data in the column will be lost.
  - You are about to drop the column `titleAlbum` on the `ListenTo` table. All the data in the column will be lost.
  - You are about to drop the column `titleMusic` on the `ListenTo` table. All the data in the column will be lost.
  - You are about to drop the `Poster` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[id]` on the table `ListenTo` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idAlbum` to the `LikeTo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idMusic` to the `LikeTo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idAlbum` to the `ListenTo` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idMusic` to the `ListenTo` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Poster" DROP CONSTRAINT "Poster_idArtist_fkey";

-- AlterTable
ALTER TABLE "LikeTo" DROP CONSTRAINT "LikeTo_pkey",
DROP COLUMN "date",
DROP COLUMN "titleAlbum",
DROP COLUMN "titleMusic",
ADD COLUMN     "idAlbum" INTEGER NOT NULL,
ADD COLUMN     "idMusic" INTEGER NOT NULL,
ADD CONSTRAINT "LikeTo_pkey" PRIMARY KEY ("idUser", "idMusic");

-- AlterTable
ALTER TABLE "ListenTo" DROP COLUMN "date",
DROP COLUMN "titleAlbum",
DROP COLUMN "titleMusic",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD COLUMN     "idAlbum" INTEGER NOT NULL,
ADD COLUMN     "idMusic" INTEGER NOT NULL,
ADD COLUMN     "listenAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "Poster";

-- CreateTable
CREATE TABLE "Banner" (
    "id" SERIAL NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "idArtist" INTEGER NOT NULL,

    CONSTRAINT "Banner_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ListenTo_id_key" ON "ListenTo"("id");

-- AddForeignKey
ALTER TABLE "Banner" ADD CONSTRAINT "Banner_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
