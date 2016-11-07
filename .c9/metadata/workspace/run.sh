{"filter":false,"title":"run.sh","tooltip":"/run.sh","undoManager":{"mark":32,"position":32,"stack":[[{"start":{"row":0,"column":0},"end":{"row":0,"column":1},"action":"insert","lines":["#"],"id":1}],[{"start":{"row":0,"column":1},"end":{"row":0,"column":2},"action":"insert","lines":["!"],"id":2}],[{"start":{"row":0,"column":2},"end":{"row":0,"column":3},"action":"insert","lines":["/"],"id":3}],[{"start":{"row":0,"column":3},"end":{"row":0,"column":4},"action":"insert","lines":["b"],"id":4}],[{"start":{"row":0,"column":4},"end":{"row":0,"column":5},"action":"insert","lines":["i"],"id":5}],[{"start":{"row":0,"column":5},"end":{"row":0,"column":6},"action":"insert","lines":["n"],"id":6}],[{"start":{"row":0,"column":6},"end":{"row":0,"column":7},"action":"insert","lines":["/"],"id":7}],[{"start":{"row":0,"column":7},"end":{"row":0,"column":8},"action":"insert","lines":["s"],"id":8}],[{"start":{"row":0,"column":8},"end":{"row":0,"column":9},"action":"insert","lines":["h"],"id":9}],[{"start":{"row":0,"column":9},"end":{"row":1,"column":0},"action":"insert","lines":["",""],"id":10}],[{"start":{"row":1,"column":0},"end":{"row":2,"column":0},"action":"insert","lines":["",""],"id":11}],[{"start":{"row":2,"column":0},"end":{"row":13,"column":0},"action":"insert","lines":["    apk update && \\","    apk upgrade && \\","    apk add git make bash gnupg findutils openssh tree pwgen && \\","    WORK_DIR=$(mktemp -d) && \\","    git -C ${WORK_DIR} init && \\","    git -C ${WORK_DIR} remote add origin https://git.zx2c4.com/password-store && \\","    git -C ${WORK_DIR} fetch origin && \\","    git -C ${WORK_DIR} checkout tags/1.6.5 && \\","    make --directory ${WORK_DIR} install && \\","    rm -rf ${WORK_DIR} && \\","    apk del make",""],"id":12}],[{"start":{"row":2,"column":0},"end":{"row":2,"column":4},"action":"remove","lines":["    "],"id":13}],[{"start":{"row":2,"column":14},"end":{"row":2,"column":15},"action":"remove","lines":["\\"],"id":14}],[{"start":{"row":2,"column":13},"end":{"row":2,"column":14},"action":"remove","lines":[" "],"id":15}],[{"start":{"row":3,"column":19},"end":{"row":3,"column":20},"action":"remove","lines":["\\"],"id":16}],[{"start":{"row":3,"column":18},"end":{"row":3,"column":19},"action":"remove","lines":[" "],"id":17}],[{"start":{"row":4,"column":64},"end":{"row":4,"column":65},"action":"remove","lines":["\\"],"id":18}],[{"start":{"row":4,"column":63},"end":{"row":4,"column":64},"action":"remove","lines":[" "],"id":19}],[{"start":{"row":5,"column":29},"end":{"row":5,"column":30},"action":"remove","lines":["\\"],"id":20}],[{"start":{"row":5,"column":28},"end":{"row":5,"column":29},"action":"remove","lines":[" "],"id":21}],[{"start":{"row":6,"column":31},"end":{"row":6,"column":32},"action":"remove","lines":["\\"],"id":22}],[{"start":{"row":6,"column":30},"end":{"row":6,"column":31},"action":"remove","lines":[" "],"id":23}],[{"start":{"row":7,"column":81},"end":{"row":7,"column":82},"action":"remove","lines":["\\"],"id":24}],[{"start":{"row":7,"column":80},"end":{"row":7,"column":81},"action":"remove","lines":[" "],"id":25}],[{"start":{"row":8,"column":39},"end":{"row":8,"column":40},"action":"remove","lines":["\\"],"id":26}],[{"start":{"row":8,"column":38},"end":{"row":8,"column":39},"action":"remove","lines":[" "],"id":27}],[{"start":{"row":9,"column":46},"end":{"row":9,"column":47},"action":"remove","lines":["\\"],"id":28}],[{"start":{"row":9,"column":45},"end":{"row":9,"column":46},"action":"remove","lines":[" "],"id":29}],[{"start":{"row":10,"column":44},"end":{"row":10,"column":45},"action":"remove","lines":["\\"],"id":30}],[{"start":{"row":10,"column":43},"end":{"row":10,"column":44},"action":"remove","lines":[" "],"id":31}],[{"start":{"row":11,"column":26},"end":{"row":11,"column":27},"action":"remove","lines":["\\"],"id":32}],[{"start":{"row":11,"column":25},"end":{"row":11,"column":26},"action":"remove","lines":[" "],"id":33}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":11,"column":25},"end":{"row":11,"column":25},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1478516366781,"hash":"16382776e8736874197ad43d58f04d52f6405542"}