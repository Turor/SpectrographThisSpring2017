This project began in Spring of 2017 in one of my Physics courses. To use the program, you have to have the signal processing toolkit of MatLab
and all of these files must be placed in the same folder within the MatLab workspace. After that simply place the audio file that you want to 
run the program on in the MatLab workspace, changing

	song = 'Starlyte - Stormchaser';
	filename = strcat(song , '.mp3');

to the desired song name and changing the file extension to the same one as the song you'd like to play. Matlab supports the following audio
file formats

	All Platforms
	WAVE (.wav)
	OGG (.ogg)
	FLAC (.flac)
	AU (.au)
	AIFF (.aiff, .aif)
	AIFC (.aifc)

	Windows 7 or later
	MP3 (.mp3)
	MPEG-4 AAC (.m4a, .mp4)

If you want to change the frequency range displayed, you can increase or decrease the variable reducF, although I've found 4 works best for
most songs.

Feel free to contact me at Turora.Business@gmail.com if you have you any questions.

For some examples of how some songs that I've rendered myself, check out https://www.youtube.com/playlist?list=PLD7Rp2G3HzJQTYWI9d4PRJ2YxtYUMuEw5
