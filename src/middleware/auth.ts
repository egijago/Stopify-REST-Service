import { Request } from "express"
import jwt, { JwtPayload } from "jsonwebtoken"
import { UnauthorizedError } from "../errors/UnauthorizedError"

export const auth = (req: Request): JwtPayload => {
  const token = req.cookies["token"]
  console.log("token", req.cookies["token"])
  if (!token) {
    throw new UnauthorizedError("Unauthorized user!")
  }
  let decoded: JwtPayload
  try {
    decoded = jwt.verify(
      token,
      process.env.ACCESS_TOKEN as string,
    ) as JwtPayload
  } catch (e) {
    throw new UnauthorizedError("Error while decoding the token!")
  }
  return decoded
}
