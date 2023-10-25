import path from 'path';
import { fileURLToPath } from 'url';

export default {
  entry: './ui/index.ts',
  output: {
    path: path.resolve(path.dirname(fileURLToPath(import.meta.url)), 'lib', 'arnold', 'app', 'public'),
    filename: 'bundle.js',
  }
};
