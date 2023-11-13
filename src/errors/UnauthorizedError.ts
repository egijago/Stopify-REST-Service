import { HTTPRequestError } from "./HTTPRequestError";

export class UnauthorizedError extends HTTPRequestError {
  constructor(message: string = "Unauthorized user!") {
    super(401, message)
  }
}
