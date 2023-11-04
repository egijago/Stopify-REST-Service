-- CreateTable
CREATE TABLE "Artist" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListenTo" (
    "titleMusic" TEXT,
    "titleAlbum" TEXT,
    "idArtist" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ListenTo_pkey" PRIMARY KEY ("idArtist")
);

-- CreateTable
CREATE TABLE "LikeTo" (
    "idUser" INTEGER NOT NULL,
    "titleMusic" TEXT,
    "titleAlbum" TEXT,
    "idArtist" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LikeTo_pkey" PRIMARY KEY ("idUser","idArtist")
);

-- CreateTable
CREATE TABLE "Poster" (
    "idArtist" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "image" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "endDate" TIMESTAMP(3) NOT NULL DEFAULT '9999-12-31 23:59:59 +00:00',

    CONSTRAINT "Poster_pkey" PRIMARY KEY ("idArtist")
);

-- CreateIndex
CREATE UNIQUE INDEX "Artist_email_key" ON "Artist"("email");

-- AddForeignKey
ALTER TABLE "ListenTo" ADD CONSTRAINT "ListenTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LikeTo" ADD CONSTRAINT "LikeTo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Poster" ADD CONSTRAINT "Poster_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
