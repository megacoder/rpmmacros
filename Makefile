TREEDIR	=${HOME}
MACDIR	=${HOME}

all::	rpmmacros

diff check::	rpmmacros
	@echo "Checking ${MACDIR}.rpmmacros setup: "
	@if [ ! -e ${MACDIR}/.rpmmacros ]; then				\
		echo "does not exist.";	\
	else								\
		diff -ruNp rpmmacros ${MACDIR}/.rpmmacros &&		\
		echo "Same";					\
	fi

install:: rpmmacros
	install -d ${MACDIR}
	install -c -m 0644 rpmmacros ${MACDIR}/.rpmmacros

uninstall::
	${RM} ${MACDIR}/.rpmmacros

tree::
	for d in BUILD RPMS/{athlon,i386,i486,i586,i686,noarch}		\
	SOURCES SPECS SRPMS; 						\
	do								\
		mkdir -p ${TREEDIR}/rpms/$${d};				\
	done

untree::
	${RM} -r ${TREEDIR}/rpms
