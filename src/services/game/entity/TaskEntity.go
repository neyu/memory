/**
游戏-任务表(TaskEntity)
任务表
**/

type AccountEntity struct {
    /** 序号 **/
    id: null/*序号*/
    /** 用户id **/
    userId: null/*用户id*/
    /** 日常任务 **/
    dailyTasks: null/*日常任务。{&quot任务id&quot:[完成数量,是否完成],&quot任务id&quot:[完成数量,是否完成],.....}*/
    /** 活跃度 **/
    vitality: 0/*活跃度*/
    /** 活跃度宝箱领取 **/
    vitalityChests: null/*活跃度宝箱领取  【是否领取，是否领取，。。】 下标代表宝箱位置*/
    /** 日常数据最后修改时间 **/
    refreshTime: null/*日常数据最后修改时间*/
    /** 成就任务 **/
    tasks: null/*成就任务。{&quot任务子类型&quot:当前正在进行任务,&quot任务子类型&quot:当前正在进行任务,.....}*/
    /** 成就任务完成数据 **/
    tasksValue: null/*成就任务完成数据  {&quot子类型&quot:数量,&quot子类型&quot:数量,...}*/
    /** 已领取的成就任务 **/
    doneTasks: null/*已领取的成就任务。 格式为[taskId1, taskId2]*/

}
_Class.tableName: 'uw_task'