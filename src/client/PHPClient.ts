const axios = require("axios")

const PHP_ORIGIN = process.env.PHP_ORIGIN

export const insertArtistPHP = async (
  name: String,
  email: String,
  image: String,
  premium: String,
) => {
  try {
    const response = await axios.post(
      PHP_ORIGIN + "/api/artists",
      {
        name: name,
        email: email,
        image: image,
        premium: premium,
      },
      "application/x-www-form-urlencoded",
    )
    return response
  } catch (error) {
    console.error("Error in route handler:", error)
    return error
  }
}

export const getMusicByMusicId = async (idMusic: number) => {
  const response = await axios(PHP_ORIGIN + "/api/musics/" + idMusic)
  return response
}

export const getGenreByGenreId = async (idGenre: number) => {
  const response = await axios(PHP_ORIGIN + "/api/genres/" + idGenre)
  return response
}
