import axios from 'axios'

const http = axios.create({
    baseURL: process.env.BASE_API,
    timeout: 5000,
})

// 在请求头添加token
http.interceptors.request.use((config) => {
    config.headers['token'] = sessionStorage.getItem('token')
    return config
}, (error) => {
    return Promise.reject(error);
})


export default http