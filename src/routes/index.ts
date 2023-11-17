import { getTopMusicByLiked } from './../controllers/like-to';
import express from "express"
import { login, logout, register } from "../controllers/artist"
import { like, unlike } from "../controllers/like-to"
import { listenTo } from "../controllers/listen-to"
import {
  getTopGenreByListener,
  getTopMusicByListener,
} from "../controllers/listen-to"
import { reset, seedPrisma } from "./seed"
import { getTopAlbumByLiked } from "../controllers/like-to"
import { createBanner } from "../services/banner"
import multer from "multer";
import { getMusicByMusicId } from "../client/PHPClient"

const router = express.Router()

// router.get("/test", async (req, res) => {
//   console.log(await getTopMusicByLiked(1));
// })

router.post("/register", register)
router.post("/login", login)
router.get("/logout", logout)

router.post("/like-tos", like)
router.delete("/like-tos", unlike)
router.get("/like-tos/top/music", getTopMusicByLiked)
router.get("/like-tos/top/album", getTopAlbumByLiked)

router.post("/listen-tos", listenTo)
router.get("/listen-tos/top/music", getTopMusicByListener)
router.get("/listen-tos/top/genre", getTopGenreByListener)

router.get("/seed", async (req, res) => {
  seedPrisma()
})

router.get("/reset", async (req, res) => {
  reset()
})

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
      cb(null, 'src/images/');
  },
  filename: function (req, file, cb) {
      cb(null, `${Date.now()}_${file.originalname}`);
  }
});

const imageUpload = multer({ storage });

router.post("/banner", imageUpload.single('file'), createBanner);


export default router
