-- CreateTable
CREATE TABLE "PaymentInfo" (
    "id" SERIAL NOT NULL,
    "idArtist" INTEGER NOT NULL,
    "cardNumber" TEXT NOT NULL,
    "cardOwner" TEXT NOT NULL,
    "cardExpMonth" INTEGER NOT NULL,
    "cardExpYear" INTEGER NOT NULL,
    "cardCvc" INTEGER NOT NULL,

    CONSTRAINT "PaymentInfo_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PaymentInfo_idArtist_key" ON "PaymentInfo"("idArtist");

-- AddForeignKey
ALTER TABLE "PaymentInfo" ADD CONSTRAINT "PaymentInfo_idArtist_fkey" FOREIGN KEY ("idArtist") REFERENCES "Artist"("id") ON DELETE CASCADE ON UPDATE CASCADE;
