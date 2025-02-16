print("script begins!")

print("hello world in lua!")

--- rimeac.setup_rime(app_name, shared_data_dir, user_data_dir, log_dir)
rimeac.setup_rime("rimeac.lua", "./shared", "./usr", "./log")
--- rimeac.init_rime()  no params, deploy
rimeac.init_rime()

--- add a session
--- rimeac.add_session() no params
rimeac.add_session()
--- print sessions list
--- rimeac.print_sessions() no params
rimeac.print_sessions()

rimeac.add_session()
rimeac.print_sessions()

rimeac.add_session()

--- select schema by schema_id
--- rimeac.select_schema(schema_id)
rimeac.select_schema("luna_pinyin")
rimeac.print_sessions()

--- kill a session by index, which is the map index of sessions, always >= 1
--- rimeac.kill_session(session_index) index >= 1
rimeac.kill_session(1)
rimeac.print_sessions()

--- switch to a session by index
--- rimeac.switch_session(session_index) index >= 1
rimeac.switch_session(2)

--- get session_id by index, if it doesn't exists, return 0
--- rimeac.get_session(session_index) index >= 1
local id = rimeac.get_session(10)
print(string.format("get_session id: 0x%x", id))
rimeac.print_sessions()

rimeac.select_schema("luna_pinyin")
rimeac.print_sessions()

--- set option to current session
--- rimeac.set_option(option_name, bool value)
rimeac.set_option("zh_simp", true)
--- rimeac.set_option("zh_trad", false)

--- get index of current session
local cindex = rimeac.get_index_of_current_session()
print("current session index: ", cindex)

local sid = rimeac.get_session(3)
local sidx = rimeac.get_index_of_session(sid)
print("specific session index: ", sidx)

--- simulate key sequence to current session
--- rimeac.simulate_keys(key_sequence)
rimeac.simulate_keys("ceshi")

--- print current session, status, context, commit
rimeac.print_session()
-- get candidates and comments in lua
local cands,cmds = rimeac.get_candidates(), rimeac.get_comments()
if #cands then
	for i, v in ipairs(cands) do
		print(cands[i], cmds[i])
	end
end
--- assert(cands[1] == '测试')
--- follow line will fail
--- assert(cands[2] == '测试')

--- select candidate on current session, >= 0
rimeac.select_candidate(2)
rimeac.print_session()

--- destroy all sessions
--- rimeac.destroy_sessions() no params
rimeac.destroy_sessions()

--- finalize rime
--- rimeac.finalize_rime() no params
rimeac.finalize_rime()

print("script ends!")
