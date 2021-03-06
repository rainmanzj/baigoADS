{* admin_show.tpl 管理员编辑界面 *}

{$cfg = [
    title          => "{$adminMod.admin.main.title} - {$lang.page.show}",
    css            => "admin_form",
    menu_active    => "admin",
    sub_active     => "list"
]}

{include "{$smarty.const.BG_PATH_TPL}admin/default/include/admin_head.tpl" cfg=$cfg}

    <li><a href="{$smarty.const.BG_URL_ADMIN}ctl.php?mod=admin&act_get=list">{$adminMod.admin.main.title}</a></li>
    <li>{$lang.page.show}</li>

    {include "{$smarty.const.BG_PATH_TPL}admin/default/include/admin_left.tpl" cfg=$cfg}

    <div class="form-group">
        <ul class="nav nav-pills nav_baigo">
            <li>
                <a href="{$smarty.const.BG_URL_ADMIN}ctl.php?mod=admin&act_get=list">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    {$lang.href.back}
                </a>
            </li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <label class="control-label static_label">{$lang.label.username}</label>
                        <p class="form-control-static input-lg">{$tplData.adminRow.admin_name}</p>
                    </div>

                    <div class="form-group">
                        <label class="control-label static_label">{$lang.label.mail}</label>
                        <p class="form-control-static input-lg">{$tplData.adminRow.ssoRow.user_mail}</p>
                    </div>

                    <div class="form-group">
                        <label class="control-label static_label">{$lang.label.nick}</label>
                        <p class="form-control-static input-lg">{if $tplData.adminRow.admin_nick}{$tplData.adminRow.admin_nick}{else}{$tplData.adminRow.ssoRow.user_nick}{/if}</p>
                    </div>

                    <div class="form-group">
                        <label class="control-label static_label">{$lang.label.allow}</label>
                        <dl class="list_dl">
                            {foreach $adminMod as $key_m=>$value_m}
                                <dt>{$value_m.main.title}</dt>
                                <dd>
                                    <ul class="list-inline">
                                        {foreach $value_m.allow as $key_s=>$value_s}
                                            <li>
                                                <span class="glyphicon glyphicon-{if isset($tplData.adminRow.admin_allow[$key_m][$key_s])}ok-circle text-success{else}remove-circle text-danger{/if}"></span>
                                                {$value_s}
                                            </li>
                                        {/foreach}
                                    </ul>
                                </dd>
                            {/foreach}

                            <dt>{$lang.label.opt}</dt>
                            <dd>
                                <ul class="list-inline">
                                    {foreach $opt as $key_s=>$value_s}
                                        <li>
                                            <span class="glyphicon glyphicon-{if isset($tplData.adminRow.admin_allow.opt[$key_s])}ok-circle text-success{else}remove-circle text-danger{/if}"></span>
                                            {$value_s.title}
                                        </li>
                                    {/foreach}
                                </ul>
                            </dd>
                        </dl>
                    </div>

                    <div class="form-group">
                        <label class="control-label static_label">{$lang.label.note}</label>
                        <p class="form-control-static input-lg">{$tplData.adminRow.admin_note}</p>
                    </div>

                    <div class="form-group">
                        <a href="{$smarty.const.BG_URL_ADMIN}ctl.php?mod=admin&act_get=form&admin_id={$tplData.adminRow.admin_id}">
                            <span class="glyphicon glyphicon-edit"></span>
                            {$lang.href.edit}
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3">
            <div class="well">
                <div class="form-group">
                    <label class="control-label static_label">{$lang.label.id}</label>
                    <p class="form-control-static">{$tplData.adminRow.admin_id}</p>
                </div>

                {if $tplData.adminRow.admin_status == "enable"}
                    {$_css_status = "success"}
                {else}
                    {$_css_status = "default"}
                {/if}

                <div class="form-group">
                    <label class="control-label static_label">{$lang.label.status}</label>
                    <p class="form-control-static label_baigo">
                        <span class="label label-{$_css_status}">{$status.admin[$tplData.adminRow.admin_status]}</span>
                    </p>
                </div>

                {if isset($tplData.adminRow.admin_allow.info)}
                    <div class="form-group label_baigo">
                        <span class="label label-danger">{$lang.label.profileInfo}</span>
                    </div>
                {/if}

                {if isset($tplData.adminRow.admin_allow.pass)}
                    <div class="form-group label_baigo">
                        <span class="label label-danger">{$lang.label.profilePass}</span>
                    </div>
                {/if}

                <div class="form-group">
                    <a href="{$smarty.const.BG_URL_ADMIN}ctl.php?mod=admin&act_get=form&admin_id={$tplData.adminRow.admin_id}">
                        <span class="glyphicon glyphicon-edit"></span>
                        {$lang.href.edit}
                    </a>
                </div>
            </div>
        </div>
    </div>

{include "{$smarty.const.BG_PATH_TPL}admin/default/include/admin_foot.tpl" cfg=$cfg}
{include "{$smarty.const.BG_PATH_TPL}admin/default/include/html_foot.tpl" cfg=$cfg}
