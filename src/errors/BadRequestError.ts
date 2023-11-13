import { HTTPRequestError } from "./HTTPRequestError"

export class BadRequestError extends HTTPRequestError {
  statusCode: number

  constructor(message: string = "Bad Request!") {
    super(400, message)
  }
}
