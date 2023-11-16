import axios, { AxiosError, AxiosResponse } from 'axios';

export const httpGetCaller = async (url: string): Promise<AxiosResponse> => {
  try {
    const response = await axios.get(url, {
      headers: {
        'Content-Type': 'application/json',
      },
    });

    return response.data;
  } catch (error) {
    // Handle error, show an error message, or take appropriate action
    console.error('Error during GET request:', error);

    // Re-throw the error to propagate it up the call stack
    throw error;
  }
};

interface ApiResponse {
    data: any; // Adjust the type according to your API response structure
}

export const httpPostCaller = async <T>(
    url: string,
    data: T,
    content_type: string 
  ): Promise<ApiResponse> => {
    try {
      const response: AxiosResponse<ApiResponse> = await axios.post(url, data, {
        headers: {
            'Content-Type': content_type
        },
      });
  
      return response.data;
    } catch (error) {
      // Handle error, show an error message, or take appropriate action
      console.error('Error during POST request:', error);
  
      // If the error is an AxiosError, you can access the response data
      if (axios.isAxiosError(error)) {
        const axiosError = error as AxiosError;
        if (axiosError.response) {
          console.error('Response data:', axiosError.response.data);
        }
      }
  
      // Re-throw the error to propagate it up the call stack
      throw error;
    }
  };