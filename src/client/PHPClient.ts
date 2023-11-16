import { httpPostCaller } from "./HttpCaller";

export const insertArtistPHP = async (name:String, image:String, premium:String) => {
    try {
        const response =await httpPostCaller("http://localhost:8000/api/artists", {
                name: name,
                image: image,
                premium: premium,
            },
            "application/x-www-form-urlencoded"
        );
        return response;
    } catch (error) {
        console.error('Error in route handler:', error);
        return error;
    }
}