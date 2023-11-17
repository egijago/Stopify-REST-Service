const soap = require("soap")

export async function call(wsdlUrl, functionName, ...args) {
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
