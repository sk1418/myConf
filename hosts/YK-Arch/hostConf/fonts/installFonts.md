## In General

- Install fonts into $HOME/fonts by coping
- Create link `/home/kent/fonts` under `/usr/share/fonts`
- Put Ignored fonts in directory: ignored_fonts/
- 20-kent-fonts-settings.conf is the preference, link to /etc/fonts/conf.d

## Commands

### Refresh cache:

	fc-cache -v -f

### Check match: 

	fc-match 
	fc-match sans
	fc-match any

### To test the config loading:

	FC_DEBUG=1024 gedit
