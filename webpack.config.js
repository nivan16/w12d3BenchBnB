const path = require('path');

module.exports = {
  // context: __dirname,
  entry: './frontend/bench_bnb.jsx',
  output: {
    path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/env', '@babel/react']
          }
        },
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};


// this is for the package.json file
// "scripts": {
//   "start": "webpack --watch --mode=development",
//     "test": "echo \"Error: no test specified\" && exit 1"
// },


//// these are for the gemfile
// gem 'better_errors'

// gem 'binding_of_caller'

// gem 'pry-rails'

// gem 'annotate'

// gem 'bcrypt'

// gem 'jquery-rails'
