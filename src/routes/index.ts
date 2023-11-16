import express from "express"
import { login, logout, register, getArtist } from "../controllers/artist"
import { like } from "../controllers/like-to"
import { listenTo } from "../controllers/listen-to"
import { createBanner } from "../controllers/banner"
import { httpGetCaller } from "../client/HttpCaller"
import { seedPrisma } from "./seed"
import { confirmSubscription, getAllPendingSubscriberByIdArtist } from "../client/SOAPClient"
const router = express.Router()

router.post("/register", register)
router.post("/login", login)
router.get("/logout", logout)

router.post("/like", like)
// router.delete("/like", unlike)
router.post("/listen", listenTo)

router.post("/banner", createBanner)

router.get("/artist/{email}", getArtist)

router.get("/foobar",  (req, res) => {
  res.send( getAllPendingSubscriberByIdArtist(1));
})

router.get("/test", async (req, res) => {
  try {
    const ress = await httpGetCaller("https://w76kp3hq-8001.asse.devtunnels.ms/api/albums");
    console.log(ress);
    return res.status(200).send({ data: ress });
  } catch (error) {
    console.error('Error in route handler:', error);
    return res.status(500).send({ error: 'Internal Server Error' });
  }
})

router.get("/seed", async (req, res) => {
  try {
      const ress = seedPrisma();
      return res.status(200).send({ data: ress });
    } catch (error) {
      console.error('Error in route handler:', error);
      return res.status(500).send({ error: 'Internal Server Error' });
    }
});

// router.get("/music/like", highestLikeByAlbum)
// router.get("/music/listen", highestListenByMusic)

// router.get("/album/like", highestLikeByAlbum)
// router.get("/album/listen", highestListenByAlbum)

export default router
