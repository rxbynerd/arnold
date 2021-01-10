const path = require('path');

module.exports = {
  entry: './src/index.jsx',
  output: {
    path: path.join(__dirname, '/../lib/arnold/app/public'),
    filename: '[name].js',
  },
  mode: 'development', // TODO: production switch
  resolve: {
    extensions: ['.js', '.jsx', '.css', '.json'],
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader'],
      },
    ],
  },
};
