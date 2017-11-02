<%!
    page_icon_class_ = 'fa fa-cog fa-fw'
    page_title_ = ['系统', '系统设置']
    page_id_ = ['system', 'config']
%>
<%inherit file="../page_base.mako"/>

<%block name="extend_js_file">
    <script type="text/javascript" src="${ static_url('js/system/config.js') }"></script>
</%block>
<%block name="embed_js">
    <script type="text/javascript">
        $app.add_options(${page_param});
    </script>
</%block>

<div class="page-content-inner">
    <div class="box box-nav-tabs">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-security" data-toggle="tab">安全</a></li>
            <li><a href="#tab-email" data-toggle="tab">邮件系统</a></li>
            <li><a href="#tab-storage" data-toggle="tab">存储</a></li>
            <li><a href="#tab-backup" data-toggle="tab">备份</a></li>
        </ul>

        <div class="tab-content">
            <!-- panel for security config -->
            <div class="tab-pane active" id="tab-security">
                <table class="table table-config-list">
                    <tr>
                        <td colspan="2" class="title">密码策略</td>
                    </tr>
                    <tr>
                        <td class="key">找回密码</td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable tp-selected">允许用户找回密码</div>
                            <span class="desc">关闭此功能，只能由管理员为用户重置密码。默认开启。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">密码强度</td>
                        <td class="value">
                            <div id="sec-force-strong-password" class="tp-checkbox tp-editable tp-selected">强制使用强密码</div>
                            <span class="desc">至少8个英文字符，必须包含大写字母、小写字母、数字和标点符号。默认开启。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">密码有效期</td>
                        <td class="value">
                            <input type="text" value="0"/><span class="unit">天</span><span class="desc">0~180。密码过期后用户将无法登录，为0则密码永不过期。默认为0。</span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="title">
                            <hr class="hr-sm"/>
                            登录设置
                        </td>
                    </tr>
                    <tr>
                        <td class="key">WEB会话超时</td>
                        <td class="value">
                            <input type="text" value="30"/><span class="unit">分钟</span><span class="desc">5~1440。超过设定时长无操作，用户将被强制登出。默认为30分钟。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">密码尝试次数</td>
                        <td class="value">
                            <input type="text" value="0"/><span class="unit">次</span><span class="desc">0~10。密码连续错误超过设定次数，用户将被临时锁定，为0则不限制。默认为0。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">临时锁定时长</td>
                        <td class="value">
                            <input type="text" value="30"/><span class="unit">分钟</span><span class="desc">0~9999。用户被临时锁定的持续时间，为0则持续到由管理员解锁。默认为30分钟。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">认证方式</td>
                        <td class="value">
                            注意：可以为每个用户指定特定的认证方式。
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable tp-selected">用户名 + 密码</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable tp-selected">用户名 + 密码 + 验证码</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable tp-selected">用户名 + 密码 + 身份认证器动态密码</div>
                        </td>
                    </tr>
                </table>
                <hr/>
                <button id="btn-save-secure-config" class="btn btn-sm btn-primary"><i class="fa fa-edit fa-fw"></i> 保存安全设置</button>

            </div>

            <!-- panel for mail config -->
            <div class="tab-pane" id="tab-email">
                <table class="table table-info-list">
                    <tr>
                        <td class="key">SMTP服务器</td>
                        <td class="value"><span id="smtp-server-info"></span></td>
                    </tr>
                    <tr>
                        <td class="key">SMTP 端口</td>
                        <td class="value"><span id="smtp-port-info"></span></td>
                    </tr>
                    <tr>
                        <td class="key">SSL模式</td>
                        <td class="value"><span id="smtp-ssl-info"></span></td>
                    </tr>
                    <tr>
                        <td class="key">发件人邮箱</td>
                        <td class="value"><span id="smtp-sender-info"></span></td>
                    </tr>
                </table>
                <hr/>
                <button id="btn-edit-mail-config" class="btn btn-sm btn-primary"><i class="fa fa-edit fa-fw"></i> 设置发件服务器</button>
            </div>

            <!-- panel for storage config -->
            <div class="tab-pane" id="tab-storage">
                <div class="alert alert-info">当前会话录像存储空间：总 123.35GB，可用空间 85.17GB。</div>
                <table class="table table-config-list">
                    <tr>
                        <td colspan="2" class="title">系统日志</td>
                    </tr>
                    <tr>
                        <td class="key">保留时间</td>
                        <td class="value">
                            <input type="text" value="0"/><span class="unit">天</span><span class="desc">30~180。仅保留指定天数的系统日志，为0则永久保留。默认为0。</span>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="title">
                            <hr class="hr-sm"/>
                            会话录像
                        </td>
                    </tr>
                    <tr>
                        <td class="key">保留时间</td>
                        <td class="value">
                            <input type="text" value="0"/><span class="unit">天</span><span class="desc">30~180。仅保留指定天数的会话录像，为0则永久保留。默认为0。</span>
                        </td>
                    </tr>
                </table>
                <hr/>
                <button id="btn-save-storage-config" class="btn btn-sm btn-primary"><i class="fa fa-edit fa-fw"></i> 保存存储设置</button>
                <button id="btn-save-storage-config" class="btn btn-sm btn-danger"><i class="fa fa-edit fa-fw"></i> 立即清理</button>
            </div>

            <!-- panel for backup config -->
            <div class="tab-pane" id="tab-backup">
                <div class="alert alert-danger">备份功能尚未实现</div>

                <table class="table table-config-list">
                    <tr>
                        <td colspan="2" class="title">数据库备份</td>
                    </tr>
                    <tr>
                        <td class="key">备份范围</td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable">包括系统日志</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable">包括报警日志</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable">包括运维记录</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">自动备份</td>
                        <td class="value">
                            <div id="sec-allow-reset-password" class="tp-checkbox tp-editable tp-selected">在指定时间点自动备份数据库</div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">备份时间点</td>
                        <td class="value">
                            <select>
                                <option>00</option>
                                <option>01</option>
                                <option>02</option>
                                <option selected="selected">03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                            </select>
                            时
                            <select>
                                <option selected="selected">00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select>
                            分
                            <span class="desc">每天在指定时间点备份数据库。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">备份保留时长</td>
                        <td class="value">
                            <input type="text" value="7"/><span class="unit">天</span><span class="desc">1~7。超过设定时间的备份将自动删除，默认为7天。</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="key"></td>
                        <td class="value">
                            <a href="javascript:;"><i class="fa fa-download"></i> 下载自动备份文件</a>
                        </td>
                    </tr>

                </table>
                <hr/>
                <button id="btn-save-storage-config" class="btn btn-sm btn-primary"><i class="fa fa-edit fa-fw"></i> 保存存储设置</button>
                <button id="btn-save-storage-config" class="btn btn-sm btn-success"><i class="fa fa-edit fa-fw"></i> 立即备份</button>
                <button id="btn-save-storage-config" class="btn btn-sm btn-danger"><i class="fa fa-edit fa-fw"></i> 导入备份</button>
            </div>
        </div>
    </div>
</div>


<%block name="extend_content">
    <!-- dialog for edit mail config -->
    <div class="modal fade" id="dlg-edit-mail-config" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="fa fa-times-circle fa-fw"></i></button>
                    <h3 class="modal-title">设置发件服务器</h3>
                </div>
                <div class="modal-body">

                    <div class="form-horizontal">

                        <div class="form-group form-group-sm">
                            <label for="edit-smtp-server" class="col-sm-3 control-label require">服务器地址：</label>
                            <div class="col-sm-5">
                                <input id="edit-smtp-server" type="text" class="form-control" placeholder="SMTP邮件服务器地址"/>
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="edit-smtp-port" class="col-sm-3 control-label require">SMTP端口：</label>
                            <div class="col-sm-2">
                                <input id="edit-smtp-port" type="text" class="form-control" placeholder="25"/>
                            </div>
                            <div class="col-sm-6">
                                <div id="edit-smtp-ssl" class="form-control-static tp-checkbox tp-editable tp-selected">使用SSL</div>
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="edit-smtp-sender" class="col-sm-3 control-label require">发件人邮箱：</label>
                            <div class="col-sm-5">
                                <input id="edit-smtp-sender" type="text" class="form-control" placeholder=""/>
                            </div>
                        </div>

                        <div class="form-group form-group-sm">
                            <label for="edit-smtp-password" class="col-sm-3 control-label require">发件人邮箱密码：</label>
                            <div class="col-sm-5">
                                <input id="edit-smtp-password" type="password" class="form-control" placeholder=""/>
                            </div>
                        </div>

                        <hr/>

                        <div class="form-group form-group-sm">
                            <label for="edit-smtp-test-recipient" class="col-sm-3 control-label">测试收件人邮箱：</label>
                            <div class="col-sm-5">
                                <input id="edit-smtp-test-recipient" type="text" class="form-control" placeholder=""/>
                            </div>
                            <div class="col-sm-4">
                                <div class="control-desc">仅用于测试。</div>
                            </div>
                        </div>


                        <div class="form-group form-group-sm">
                            <div class="col-sm-offset-3 col-sm-5">
                                <button type="button" class="btn btn-sm btn-success" id="btn-send-test-mail"><i class="fa fa-send fa-fw"></i> 发送测试邮件</button>
                            </div>
                        </div>

                        <div id="msg-send-test-mail" class="alert alert-success" style="display:none;">
                            <p><i class="fa fa-info-circle fa-fw"></i> 邮件发送成功！</p>
                            <p>请到您的收件箱中检查是否已正确接收到测试邮件（如未能接收到，请注意检查测试邮件是否被归类为垃圾邮件了）。</p>
                            <p>确定能正常接收邮件后，即可应用并保存以上设置了！</p>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-primary" id="btn-save-mail-config"><i class="fa fa-check fa-fw"></i> 应用并保存设置</button>
                    <button type="button" class="btn btn-sm btn-default" data-dismiss="modal"><i class="fa fa-close fa-fw"></i> 取消</button>
                </div>
            </div>
        </div>
    </div>

</%block>
