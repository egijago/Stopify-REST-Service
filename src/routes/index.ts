import express from "express";
const router = express.Router();

import { register } from "../controllers/auth/register";
import { login } from "../controllers/auth/login";
import { logout } from "../controllers/auth/logout";
import { likeTo } from "../controllers/like/like";
import { listenTo } from "../controllers/listen/listen";
import { createPoster } from "../controllers/poster/poster";
import { highestLikeByAlbum, highestLikeByMusic } from "../controllers/like/analytic";
import { highestListenByAlbum, highestListenByMusic } from "../controllers/listen/analytic";

router.post("/register", register)
router.post("/login", login)
router.get("/logout",logout)

router.post("/like",likeTo)
router.post("/listen",listenTo)

router.post("/poster",createPoster)

router.get("/music/like",highestLikeByMusic)
router.get("/music/listen",highestListenByMusic)

router.get("/album/like",highestLikeByAlbum)
router.get("/album/listen",highestListenByAlbum)

export default router;