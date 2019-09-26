/**
 * 验证开头是否为app-，手机页面头
 * @param {*} s
 */
export function isAppPages(s) {
    return /^(app-).*/.test(s)
}
