import { call } from "./SoapCaller"

const wsdlUrl = process.env.SOAP_ORIGIN + "/ws/payment?wsdl"

export interface IProcessPayment {
  idUser: number
  idArtist: number
  amount: number
  cardNumber: string
  cardOwner: string
  cardExpMonth: number
  cardExpYear: number
  cardCvc: number
}
export const processPayment = async ({
  idUser,
  idArtist,
  amount,
  cardNumber,
  cardOwner,
  cardExpMonth,
  cardExpYear,
  cardCvc,
}: IProcessPayment) => {
  try {
    const functionName = "processPayment"
    const result = await call(
      wsdlUrl,
      functionName,
      idUser,
      idArtist,
      amount,
      cardNumber,
      cardOwner,
      cardExpMonth,
      cardExpYear,
      cardCvc,
    )
    console.log("SOAP call result:", result)
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}

export const getTotalPaymentByIdArtist = async (idArtist: number) => {
  try {
    const functionName = "getTotalPaymentByIdArtist"
    const result = await call(wsdlUrl, functionName, idArtist)
    console.log("SOAP call result:", result)
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}
