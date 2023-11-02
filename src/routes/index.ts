import express from "express";
const router = express.Router();

import { register } from "../controllers/auth/register";
import { login } from "../controllers/auth/login";

router.post("/register", register);
router.post("/login", login);

export default router;