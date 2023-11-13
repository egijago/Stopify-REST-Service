import express from "express"
import { login, logout, register } from "../controllers/artist"
import { likeTo } from "../controllers/like-to"
import { listenTo } from "../controllers/listen-to"
import { createBanner } from "../services/banner"
const router = express.Router()

router.post("/register", register)
router.post("/login", login)
router.get("/logout", logout)

router.post("/like", likeTo)
router.post("/listen", listenTo)

router.post("/banner", createBanner)

// router.get("/music/like", highestLikeByAlbum)
// router.get("/music/listen", highestListenByMusic)

// router.get("/album/like", highestLikeByAlbum)
// router.get("/album/listen", highestListenByAlbum)

export default router
