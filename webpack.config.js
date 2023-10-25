import path from 'path';
import { fileURLToPath } from 'url';

const isProduction = process.env.NODE_ENV === 'production';

export default {
  entry: './ui/index.tsx',
  output: {
    path: path.resolve(path.dirname(fileURLToPath(import.meta.url)), 'lib', 'arnold', 'app', 'public'),
    filename: 'bundle.js',
  },
  resolve: {
    extensions: ['.tsx', '.ts', '.jsx', '.js', '.css', '.json'],
  },
  mode: isProduction ? 'production' : 'development',
  module: {
    rules: [
      {
        test: /\.(tsx|ts)$/,
        exclude: /node_modules/,
        loader: 'babel-loader'
      },
      {
        test: /\.css$/i,
        exclude: /node_modules/,
        use: ['style-loader', 'css-loader']
      }
    ]
  }
};
