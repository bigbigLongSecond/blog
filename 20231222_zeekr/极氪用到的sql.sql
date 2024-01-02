-- public.system_chat_file_id_seq_wwc88cad11b766e051 definition

-- DROP SEQUENCE public.system_chat_file_id_seq_wwc88cad11b766e051;

CREATE SEQUENCE public.system_chat_file_id_seq_wwc88cad11b766e051
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

-- public.system_chat_file_wwc88cad11b766e051 definition

-- Drop table

-- DROP TABLE public.system_chat_file_wwc88cad11b766e051;

CREATE TABLE public.system_chat_file_wwc88cad11b766e051 (
	id int8 NOT NULL DEFAULT nextval('system_chat_file_id_seq_wwc88cad11b766e051'::regclass), -- 文件id
	msg_id varchar(512) NULL, -- msg_id
	md5_sum varchar(512) NOT NULL, -- 资源的md5值
	session_id varchar(512) NOT NULL,
	seq int8 NULL,
	file_name varchar(512) NULL, -- 文件名称
	msg_time int8 NULL, -- 会话时间
	sdk_file_id varchar NULL, -- 媒体资源的id信息
	msg_type varchar(512) NULL, -- 会话类型
	file_size int8 NULL, -- 文件大小，单位字节
	file_ext varchar(512) NULL, -- 文件后缀
	from_id varchar(512) NULL, -- 发送人id
	to_id varchar NULL, -- 接收会话的id
	chat_type int2 NULL, -- 聊天类型（0-群聊 1-单聊）
	send_type int2 NULL, -- 文件发送人标识（0-员工发送 1-其他类型发送的文件）
	create_time timestamp NULL, -- 创建时间
	update_time timestamp NULL, -- 修改时间
	tenant_id varchar(512) NULL, -- 租户id
	"action" varchar(512) NULL,
	is_delete int2 NULL, -- 逻辑删除
	user_ides _text NULL,
	dept_ides _text NULL,
	tag_ides _text NULL,
	CONSTRAINT system_chat_file_id_seq_wwc88cad11b766e051_pk PRIMARY KEY (id, session_id)
)
PARTITION BY HASH (session_id);
COMMENT ON TABLE public.system_chat_file_wwc88cad11b766e051 IS '文件分级记录表';

-- Column comments

COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.id IS '文件id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_id IS 'msg_id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.md5_sum IS '资源的md5值';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_name IS '文件名称';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_time IS '会话时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.sdk_file_id IS '媒体资源的id信息';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_type IS '会话类型';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_size IS '文件大小，单位字节';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_ext IS '文件后缀';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.from_id IS '发送人id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.to_id IS '接收会话的id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.chat_type IS '聊天类型（0-群聊 1-单聊）';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.send_type IS '文件发送人标识（0-员工发送 1-其他类型发送的文件）';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.create_time IS '创建时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.update_time IS '修改时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.tenant_id IS '租户id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.is_delete IS '逻辑删除';

COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.id IS '文件id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_id IS 'msg_id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.md5_sum IS '资源的md5值';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_size IS '文件大小，单位字节';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_name IS '文件名称';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_time IS '会话时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.sdk_file_id IS '媒体资源的id信息';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.msg_type IS '会话类型';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.file_ext IS '文件后缀';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.create_time IS '创建时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.update_time IS '修改时间';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.tenant_id IS '租户id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.from_id IS '发送人id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.is_delete IS '逻辑删除';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.to_id IS '接收会话的id';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.chat_type IS '聊天类型（0-群聊 1-单聊）';
COMMENT ON COLUMN public.system_chat_file_wwc88cad11b766e051.send_type IS '文件发送人标识（0-员工发送 1-其他类型发送的文件）';



create table system_chat_file_wwc88cad11b766e051_0 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 0);
create table system_chat_file_wwc88cad11b766e051_1 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 1);
create table system_chat_file_wwc88cad11b766e051_2 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 2);
create table system_chat_file_wwc88cad11b766e051_3 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 3);
create table system_chat_file_wwc88cad11b766e051_4 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 4);
create table system_chat_file_wwc88cad11b766e051_5 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 5);
create table system_chat_file_wwc88cad11b766e051_6 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 6);
create table system_chat_file_wwc88cad11b766e051_7 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 7);
create table system_chat_file_wwc88cad11b766e051_8 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 8);
create table system_chat_file_wwc88cad11b766e051_9 partition of system_chat_file_wwc88cad11b766e051 for values with (modulus 10, remainder 9);



-- public.classify_data definition

-- Drop table

-- DROP TABLE public.classify_data;

CREATE TABLE public.classify_data (
	id int8 NOT NULL, -- 分级id
	classify_name varchar(512) NULL, -- 级别类型
	classify_sort int4 NULL, -- 排序
	tenant_id varchar(512) NULL, -- 租户id
	create_time timestamp NULL, -- 创建时间
	update_time timestamp NULL, -- 修改时间
	create_by varchar(512) NULL, -- 创建人
	update_by varchar(512) NULL, -- 修改人
	is_delete int2 NULL, -- 逻辑删除
	CONSTRAINT classify_data_pk PRIMARY KEY (id)
);
COMMENT ON TABLE public.classify_data IS '分级字典表';

-- Column comments

COMMENT ON COLUMN public.classify_data.id IS '分级id';
COMMENT ON COLUMN public.classify_data.classify_name IS '级别类型';
COMMENT ON COLUMN public.classify_data.classify_sort IS '排序';
COMMENT ON COLUMN public.classify_data.tenant_id IS '租户id';
COMMENT ON COLUMN public.classify_data.create_time IS '创建时间';
COMMENT ON COLUMN public.classify_data.update_time IS '修改时间';
COMMENT ON COLUMN public.classify_data.create_by IS '创建人';
COMMENT ON COLUMN public.classify_data.update_by IS '修改人';
COMMENT ON COLUMN public.classify_data.is_delete IS '逻辑删除';


-- public.system_chat_file_grade_wwc88cad11b766e051 definition

-- Drop table

-- DROP TABLE public.system_chat_file_grade_wwc88cad11b766e051;

CREATE TABLE public.system_chat_file_grade_wwc88cad11b766e051 (
	create_time timestamp NULL, -- 创建时间
	update_time timestamp NULL, -- 修改时间
	tenant_id varchar(512) NULL, -- 租户id
	classify_id int8 NULL, -- 分级id
	"md5Sum" text NOT NULL, -- 资源的md5值
	is_delete int2 NULL, -- 逻辑删除
	user_ides _text NULL,
	dept_ides _text NULL,
	tag_ides _text NULL,
	id int8 NOT NULL,
	CONSTRAINT system_file_classification_grade_wwc88cad11b766e051_pk PRIMARY KEY (id)
);
CREATE INDEX system_first_file_classification_wwc88cad11b766e051_user_ides_d ON public.system_chat_file_grade_wwc88cad11b766e051 USING btree (user_ides, dept_ides, tag_ides);
COMMENT ON TABLE public.system_chat_file_grade_wwc88cad11b766e051 IS '文件分级记录表';

-- Column comments

COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051.create_time IS '创建时间';
COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051.update_time IS '修改时间';
COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051.tenant_id IS '租户id';
COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051.classify_id IS '分级id';
COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051."md5Sum" IS '资源的md5值';
COMMENT ON COLUMN public.system_chat_file_grade_wwc88cad11b766e051.is_delete IS '逻辑删除';

INSERT INTO public.upms_menu (id, menu_name, parent_id, menu_code, menu_level, menu_label, menu_sort, tenant_id, create_time, update_time, is_delete) VALUES(20105, '文件检索', 201, '002001005', 3, 'file-search', 5, 'needReplaceTenantId', '2023-07-21 01:42:10.912', '2023-07-21 01:42:10.912', 0);

