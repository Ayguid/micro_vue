export default {
    methods: {
      $checkFileStl:function(fls){
        for (var i = 0; i < fls.length; i++) {
          if (fls[i].file_path.split('.').pop()=='stl') {
            return fls[i];
          }
        }
      },
      $checkFileType:function(fl){
        if (fl.split('.').pop()=='png'||fl.split('.').pop()=='jpg') {
          return 'img';
        }
      },
    },
};
