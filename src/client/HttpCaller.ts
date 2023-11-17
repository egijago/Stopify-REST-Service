import axios, { AxiosError, AxiosResponse } from "axios"

export const httpGetCaller = async (url: string): Promise<AxiosResponse> => {
  try {
    const response = await axios.get(url, {
      headers: {
        "Content-Type": "application/json",
      },
    })

    return response.data
  } catch (error) {
    console.error("Error during GET request:", error)
    throw error
  }
}

interface ApiResponse {
  data: any
}
export const httpPostCaller = async <T>(
  url: string,
  data: T,
  content_type: string,
): Promise<ApiResponse> => {
  try {
    const response: AxiosResponse<ApiResponse> = await axios.post(url, data, {
      headers: {
        "Content-Type": content_type,
      },
    })

    return response.data
  } catch (error) {
    console.error("Error during POST request:", error)
    if (axios.isAxiosError(error)) {
      const axiosError = error as AxiosError
      if (axiosError.response) {
        console.error("Response data:", axiosError.response.data)
      }
    }
    throw error
  }
}
