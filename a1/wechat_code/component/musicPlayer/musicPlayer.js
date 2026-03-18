Component({
        properties: {
            tableName: {
                type: String,
                value: '',
            },
            playlist: {
                type: Array,
                value: [],
                observer(newVal) {
                  this.setData({ list: newVal });
                  if (newVal.length > 0 && this.data.musicIndex === -1) {
                    this.setData({ musicIndex: 0 });
                    this.playMusic(0);
                  }
                }
              }
        },
    data: {
        baifenbi: 0,
        allTime: 0,
        nowTime: 0,
        playTime: 0,
        musicIndex: -1,
        list: [],
        playType: false,
        playIndex: 1, //1单曲 //2列表 //3随机
        listShow: false,
        bottomHeight:0,
        baseUrl: wx.getStorageSync('baseURL') + "/",
    },
    ready() {
        let that = this;
        this.setData({innerAudioContext:wx.createInnerAudioContext()})
 console.log('aa');
        wx.getSystemInfo({
            success(res) {
                that.bottomHeight = res.windowBottom
            }
        })
    },
    lifetimes: {
        attached() {
            this.innerAudioContext = wx.createInnerAudioContext();
            this.initAudioListeners();
            wx.getSystemInfo({
              success: res => this.setData({ bottomHeight: res.windowBottom })
            });
          },
          detached() {
            this.innerAudioContext.destroy();
          }
    },
    methods: {
        playMusic(index) {
            if (!this.data.list[index]) return;
            
            this.setData({ musicIndex: index });
            const url = `${this.data.baseUrl}${this.data.list[index].songfile}`;
            
            if (this.innerAudioContext.src !== url) {
              this.innerAudioContext.stop();
              this.innerAudioContext.src = url;
              this.innerAudioContext.autoplay = true;
            }
            
            if (this.data.playIndex === 1) {
              this.innerAudioContext.loop = true;
            } else {
              this.innerAudioContext.loop = false;
            }
          },
          initAudioListeners() {
            const ictx = this.innerAudioContext;
      
            // 正确的时间更新监听
            ictx.onTimeUpdate(() => {
              // 添加数据有效性校验
              const current = this.validateTime(ictx.currentTime);
              const duration = this.validateTime(ictx.duration);
              
              console.log('[修正调试] 当前时间:', current, '总时长:', duration);
              
              this.setData({
                nowTime: current,
                allTime: duration,
                baifenbi: duration > 0 ? (current / duration * 100) : 0
              });
            });
      
            // 新增音频元数据加载完成监听
            ictx.onCanplay(() => {
              const validDuration = this.validateTime(ictx.duration);
              console.log('[元数据加载] 实际音频时长:', validDuration);
              this.setData({ allTime: validDuration });
            });
          },
         // 新增时间验证方法
    validateTime(seconds) {
        // 过滤异常值：正常歌曲时长不超过24小时（86400秒）
        if (isNaN(seconds) || seconds < 0 || seconds > 86400) {
          console.warn('异常时间值已过滤:', seconds);
          return 0;
        }
        return Math.floor(seconds);
      },
        close() {
            this.setData({
                listShow: false
            })
        },
        stopClick() {
            // innerAudioContext.stop()
            this.innerAudioContext.pause();
        },
       
      // 优化后的时间格式化方法
      getTimeStr(seconds) {
        const validSeconds = this.validateTime(seconds);
        const mins = Math.floor(validSeconds / 60);
        const secs = validSeconds % 60;
   
        return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
      },
        
      sliderChange(e) {
        const seekTime = (e.detail.value / 100) * this.data.allTime;
        this.innerAudioContext.seek(seekTime);
      }
  ,
        changeMusic(item) {
            for (let x in this.data.list) {
                if (this.data.list[x].id == item.id) {
                    this.setData({
                        musicIndex:Number(x)
                    })
                    return false
                }
            }
            return true
        },
        playAllClick(item,list){
            this.setData({
                list:list
            })
            this.playClick(item)
        },
        playClick(item) {
            this.innerAudioContext.onPlay(() => {
                console.log('[调试] 音频开始播放');
                this.setData({ playType: true });
            });
            
            this.innerAudioContext.onError(res => {
                console.error('[错误] 音频播放失败:', res);
                wx.showToast({
                    title: '音频加载失败',
                    icon: 'none'
                });
            });
            const crrList=this.data.list;
            if (this.changeMusic(item)) {
                crrList.push(item)
                this.setData({
                    list:crrList,
                    musicIndex:this.data.list.length - 1
                })
            }
            this.innerAudioContext.src = this.data.baseUrl + this.data.list[this.data.musicIndex].songfile;
            this.innerAudioContext.play();
            this.innerAudioContext.onPlay(() => {
                this.setData({playType: true});
            })
            this.innerAudioContext.onPause(() => {
                this.setData({playType: false});
            })
            this.innerAudioContext.onTimeUpdate(() => {
                const currentTime = this.innerAudioContext.currentTime * 1000; // 转为毫秒
                const duration = this.innerAudioContext.duration * 1000; // 转为毫秒
                this.setData({
                    nowTime: currentTime,
                    allTime: duration,
                    baifenbi: duration ? Number((currentTime / duration * 100).toFixed(2)) : 0
                });
            });
            this.innerAudioContext.onEnded(() => {
                if (this.data.playIndex == 1) {
                    this.innerAudioContext.src = this.data.baseUrl + this.data.list[this.data.musicIndex].songfile;
                    this.innerAudioContext.play()
                } else if (this.data.playIndex == 2) {
                    let i = this.data.musicIndex
                    if (i == this.data.list.length - 1) {
                        i = 0
                    } else {
                        i++
                    }
                    this.setData({
                        musicIndex:i
                    })
                    this.innerAudioContext.src = this.data.baseUrl + this.data.list[this.data.musicIndex].songfile;
                    this.innerAudioContext.play()
                } else if (this.data.playIndex == 3) {
                    let i = Number(this.data.list.length - 1)
                    let a = this.random(0, i)
                    this.setData({
                        musicIndex:a
                    })
                    this.innerAudioContext.src = this.data.baseUrl + this.data.list[this.data.musicIndex].songfile;
                    this.innerAudioContext.play()
                }
            })
        },
        random(min, max) {

            return Math.floor(Math.random() * (max - min)) + min;

        },
        playsClick() {
            console.log('');
            this.innerAudioContext.play()
        },
        pauseClick() {
            this.innerAudioContext.pause()
        },
        playIndexClick(e) {
            const mode = Number(e.currentTarget.dataset.index);
            this.setData({ playIndex: mode });
            if (mode === 1) this.innerAudioContext.loop = true;
          },
      
        listClick() {
            this.listShow = true
        },
        delListClick(e) {
            const index = e.currentTarget.dataset.index;
            const newList = this.data.list.filter((_, i) => i !== index);
            
            if (index === this.data.musicIndex) {
              if (newList.length === 0) {
                this.innerAudioContext.stop();
                this.setData({ list: [], musicIndex: -1 });
              } else {
                const newIndex = Math.min(index, newList.length - 1);
                this.playMusic(newIndex);
              }
            }
            
            this.setData({ list: newList });
          },
      
        playListClick(e) {
            const index = e.currentTarget.dataset.index;
            this.playMusic(Number(index));
          },
      

    }
});