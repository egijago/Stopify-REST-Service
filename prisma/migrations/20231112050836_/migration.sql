/*
  Warnings:

  - A unique constraint covering the columns `[id]` on the table `Artist` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Artist" ALTER COLUMN "id" DROP DEFAULT;
DROP SEQUENCE "Artist_id_seq";

-- CreateIndex
CREATE UNIQUE INDEX "Artist_id_key" ON "Artist"("id");
