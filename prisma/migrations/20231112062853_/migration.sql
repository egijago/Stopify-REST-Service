/*
  Warnings:

  - The primary key for the `LikeTo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[idUser,idMusic]` on the table `LikeTo` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "LikeTo" DROP CONSTRAINT "LikeTo_pkey",
ADD COLUMN     "id" SERIAL NOT NULL,
ADD CONSTRAINT "LikeTo_pkey" PRIMARY KEY ("id");

-- CreateIndex
CREATE UNIQUE INDEX "LikeTo_idUser_idMusic_key" ON "LikeTo"("idUser", "idMusic");
