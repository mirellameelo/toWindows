Okvis -> windows
1)	“time”: 
	a.	Time (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: okvis_time\include

2)	“ kinematics” : 
	a.	Gteste (dependencia externa)
		i.	em pré-processador _USE_MATH_DEFINES
		ii.	Em propriedades -> diretório de inclusão adc: include\gteste
		iii.	https://github.com/google/googletest

	b.	Eigen3 (dependencia externa)
		i.	modificação de __inline__ para inline
		ii.	Em propriedades -> diretório de inclusão adc: include\eigen
		iii.	http://eigen.tuxfamily.org/index.php?title=Main_Page

	c.	Kinematics (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: include\kinematics

3)	“util”
	a.	Util (dependência interna)
		i.	Em propriedades -> diretório de inclusão adc: include\util
