import { call } from "./SoapCaller"

const wsdlUrl = process.env.SOAP_ORIGIN + "/ws/subscription?wsdl"

export const confirmSubscription = async (idArtist: number, idUser: number) => {
  try {
    const functionName = "confirmSubscription"
    const result = await call(wsdlUrl, functionName, idArtist, idUser)
    console.log("SOAP call result:", result)
    return result
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}

export const declineSubscription = async (idArtist: number, idUser: number) => {
  try {
    const functionName = "declineSubscription"
    const result = await call(wsdlUrl, functionName, idArtist, idUser)
    console.log("SOAP call result:", result)
    return result
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}

export const getAllPendingSubscriberByIdArtist = async (idArtist: number) => {
  try {
    const functionName = "getAllPendingSubscriberByIdArtist"
    const result = await call(wsdlUrl, functionName, idArtist)
    console.log("SOAP call result:", result)
    return result
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}
