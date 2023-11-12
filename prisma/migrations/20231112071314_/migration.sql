-- DropForeignKey
ALTER TABLE "Banner" DROP CONSTRAINT "Banner_idArtist_fkey";

-- DropForeignKey
ALTER TABLE "LikeTo" DROP CONSTRAINT "LikeTo_idArtist_fkey";

-- DropForeignKey
ALTER TABLE "ListenTo" DROP CONSTRAINT "ListenTo_idArtist_fkey";

-- AlterTable
ALTER TABLE "Artist" ADD COLUMN     "active" BOOLEAN NOT NULL DEFAULT true;

-- AddForeignKey
ALTER TABLE "ListenTo" ADD CONSTRAINT "ListenTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikeTo" ADD CONSTRAINT "LikeTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Banner" ADD CONSTRAINT "Banner_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE CASCADE ON UPDATE CASCADE;
