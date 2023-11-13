/*
  Warnings:

  - The primary key for the `ListenTo` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Made the column `name` on table `Artist` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX "Artist_id_key";

-- DropIndex
DROP INDEX "ListenTo_id_key";

-- AlterTable
CREATE SEQUENCE artist_id_seq;
ALTER TABLE "Artist" ALTER COLUMN "id" SET DEFAULT nextval('artist_id_seq'),
ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "updatedAt" DROP NOT NULL,
ALTER COLUMN "active" DROP NOT NULL;
ALTER SEQUENCE artist_id_seq OWNED BY "Artist"."id";

-- AlterTable
ALTER TABLE "Banner" ALTER COLUMN "createdAt" DROP NOT NULL,
ALTER COLUMN "updatedAt" DROP NOT NULL;

-- AlterTable
ALTER TABLE "ListenTo" DROP CONSTRAINT "ListenTo_pkey",
ALTER COLUMN "listenAt" DROP NOT NULL,
ADD CONSTRAINT "ListenTo_pkey" PRIMARY KEY ("id");
