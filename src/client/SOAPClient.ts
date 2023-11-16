const soap = require("soap")
const wsdlUrl = process.env.SOAP_ORIGIN + "/ws/subscription?wsdl"

async function call(wsdlUrl, functionName, ...args) {
  return new Promise((resolve, reject) => {
    soap.createClient(wsdlUrl, function (err, client) {
      if (err) {
        reject("Error creating SOAP client: " + err)
      } else {
        const params = {}
        args.forEach((arg, index) => {
          params[`arg${index}`] = arg
        })
        client.addHttpHeader("api-key", process.env.API_KEY)
        client[functionName](params, function (err, result) {
          if (err) {
            reject("SOAP call error: " + err)
          } else {
            resolve(result)
          }
        })
      }
    })
  })
}

export const confirmSubscription = async (idArtist: number, idUser: number) => {
  try {
    const functionName = "confirmSubscription"
    const result = await call(wsdlUrl, functionName, idArtist, idUser)
    console.log("SOAP call result:", result)
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}

export const declineSubscription = async (idArtist: number, idUser: number) => {
  try {
    const functionName = "declineSubscription"
    const result = await call(wsdlUrl, functionName, idArtist, idUser)
    console.log("SOAP call result:", result)
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}

export const getAllPendingSubscriberByIdArtist = async (idArtist: number) => {
  try {
    const functionName = "getAllPendingSubscriberByIdArtist"
    const result = await call(wsdlUrl, functionName, idArtist)
    console.log("SOAP call result:", result)
  } catch (error) {
    console.error("SOAP call failed:", error)
  }
}
