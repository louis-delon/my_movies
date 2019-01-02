const { environment } = require('@rails/webpacker')

module.exports = environment

environment.loaders.prepend('erb', {
  test: /\.erb$/,
  enforce: 'pre',
  use: [{
    loader: 'rails-erb-loader',
  }]
})
