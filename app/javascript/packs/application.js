// import { apiResults } from './movies.js.erb';
console.log('Hello World from Webpacker')


// you can't acces functions defined in webpack
// outside of webpack unless you attach it to `window`,
// remove the import in `application.js`,
// instead of `export { previewFile };`
// do `window.previewFile = previewFile;`
// then you'll be able to acces it in your views, add
// `javascript_pack_tag("form")`
// in a `content_for :after_js`,
// and then you'll be able to change your input
// to `<%= f.input :avatar, input_html: { onchange: 'window.previewFile()' } %>`

