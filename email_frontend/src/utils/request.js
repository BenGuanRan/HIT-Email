import http from './http'
import FormData from 'form-data'
const request = {
    get(url, params = {}) {
        return http.get(url, { params: { ...params } })
    },
    post(url, body = {}) {
        const data = new FormData()
        for (let i in body) {
            data.append(i, body[i]);
        }
        return http.post(url, data)
    }
}

export default request