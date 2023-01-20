-- const styles = require('./Foo.css');
-- import styles from './Foo.css';
vim.api.nvim_create_user_command('ReqToImp', [[s/const \(\w\+\)\s\?=\s\?\w\+(\(['"].*['"]\))/import \1 from \2/]], {})


