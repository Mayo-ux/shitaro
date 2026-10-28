-- Statically extracted preserved payload; entrypoint/runtime behavior is unverified.

local __devirt_support = {
[2] = table.move,
[25] = table.pack,
["ds"] = function(U,K,R,...)
	local _=U[25](...);
	U[2](_,1,_.n,R+1,K);
end,
}

return (function(U,K,K,K,K)
	return function(K)
		return function(...)
			local K={cache={}};
			K.load=function(R)
				if not(K.cache[R])then 
					local _,N=K.cache,{};
					N.c,_[R]=K[R](),N;
				end;
				return K.cache[R].c;
			end;
			K.a=function()
				local R=getgenv();
				local _=rawget(R,"\0sh");
				local N;
				if type(_)~="table"then 
					_={fields={},detours={}};
					rawset(R,"\0sh",_);
					N=_;
				else 
					N=_;
				end;
				local R=cloneref and cloneref(game:GetService("RunService"))or game:GetService("RunService");
				local _=hookfunction or replaceclosure;
				local h,F,t=restorefunction or restorefunc,isreadonly,setreadonly;
				local function f(l)
					if type(t)~="function"then 
						return false;
					elseif type(F)~="function"then 
						return false;
					end;
					local g,u=pcall(F,l);
					if g then 
						if not(u)then 
							return false;
						end;
					else 
						return false;
					end;
					return pcall(t,l,false);
				end;
				local function F(l,g)
					if g then 
						pcall(t,l,true);
					end;
				end;
				local function t(l,g,u)
					local s,C=f(l),pcall(function()
						l[g]=u;
					end);
					F(l,s);
					return C;
				end;
				local F,f,l,g,u,s={},{},{},{},{},true;
				local C,z={shared=N,takeover=function()
					local q=N.unload;
					N.unload=nil;
					if type(q)=="function"then 
						pcall(q);
					end;
				end,publish=function(q)
					N.unload=q;
				end,adopt=function(q)
					if q then 
						F[#F+1]=q;
					end;
					return q;
				end,connect=function(q,r)
					local x=q:Connect(r);
					F[#F+1]=x;
					return x;
				end,bind=function(q,r)
					local x="\0"..tostring(math.random(10000000,90000000));
					R:BindToRenderStep(x,q,r);
					f[#f+1]=x;
					return x;
				end,own=function(q)
					l[#l+1]=q;
					return q;
				end,spawn=function(q,...)
					local r=task.spawn(q,...);
					g[#g+1]=r;
					return r;
				end,teardown=function(q)
					u[#u+1]=q;
					return q;
				end,field=function(q,r,x)
					local G,a=N.fields[q];
					if G then 
						a=G;
					else 
						G={};
						N.fields[q]=G;
						a=G;
					end;
					local G,m=a[r];
					if G==nil then 
						G=q[r];
						if G==nil then 
							return nil;
						end;
						a[r]=G;
						m=G;
					else 
						m=G;
					end;
					local G=x(m);
					if type(G)~="function"then 
						return m;
					end;
					if not(t(q,r,G))then 
						a[r]=nil;
						return m;
					end;
					u[#u+1]=function()
						if q[r]==G then 
							t(q,r,m);
						end;
						a[r]=nil;
					end;
					return m;
				end,detour=function(t,q)
					if type(_)~="function"then 
						return nil;
					elseif type(t)~="function"then 
						return nil;
					end;
					local r=N.detours[t];
					if r then 
						return r;
					end;
					local r,x=pcall(_,t,q);
					if r then 
						if type(x)~="function"then 
							return nil;
						end;
					else 
						return nil;
					end;
					N.detours[t]=x;
					u[#u+1]=function()
						if type(h)~="function"then 
							pcall(_,t,x);
						elseif not(pcall(h,t))then 
							pcall(_,t,x);
						end;
						N.detours[t]=nil;
					end;
					return x;
				end},getupvalues or debug and debug.getupvalues;
				local _=setupvalue or debug and debug.setupvalue;
				C.upvalue=function(h,t,q)
					if type(z)~="function"then 
						return false;
					elseif type(_)~="function"then 
						return false;
					end;
					local r,x=pcall(z,h);
					if r then 
						if type(x)~="table"then 
							return false;
						end;
					else 
						return false;
					end;
					local r=x[t];
					if not(pcall(_,h,t,q))then 
						return false;
					end;
					u[#u+1]=function()
						local x,G=pcall(z,h);
						if x then 
							if type(G)=="table"then 
								if G[t]==q then 
									pcall(_,h,t,r);
								end;
							end;
						end;
					end;
					return true;
				end;
				C.alive=function()
					local _=s;
					return _;
				end;
				C.release=function()
					if not(s)then 
						return;
					end;
					s=false;
					for _=#u,1,-1 do 
						pcall(u[_]);
						u[_]=nil;
					end;
					for _=#f,1,-1 do 
						pcall(R.UnbindFromRenderStep,R,f[_]);
						f[_]=nil;
					end;
					for R=#F,1,-1 do 
						local _=F[R];
						F[R]=nil;
						if typeof(_)=="RBXScriptConnection"then 
							pcall(_.Disconnect,_);
						elseif type(_)=="function"then 
							pcall(_);
						elseif type(_)=="table"then 
							if type(_.Disconnect)=="function"then 
								pcall(_.Disconnect,_);
							end;
						end;
					end;
					for R=#g,1,-1 do 
						pcall(task.cancel,g[R]);
						g[R]=nil;
					end;
					for R=#l,1,-1 do 
						local _=l[R];
						l[R]=nil;
						pcall(_.Destroy,_);
					end;
					N.unload=nil;
				end;
				return C;
			end;
			K.b=function()
				local R=cloneref or function(_)
					return _;
				end;
				local _,N=getgenv(),{};
				N.players=game:GetService("Players");
				N.run=R(game:GetService("RunService"));
				N.input=R(game:GetService("UserInputService"));
				N.storage=R(game:GetService("ReplicatedStorage"));
				N.lighting=R(game:GetService("Lighting"));
				N.workspace=R(game:GetService("Workspace"));
				N.collection=R(game:GetService("CollectionService"));
				N.guiservice=R(game:GetService("GuiService"));
				N.http=R(game:GetService("HttpService"));
				N.stats=R(game:GetService("Stats"));
				N.tween=R(game:GetService("TweenService"));
				N.sounds=R(game:GetService("SoundService"));
				N.content=R(game:GetService("ContentProvider"));
				N.assets=R(game:GetService("AssetService"));
				N.debris=R(game:GetService("Debris"));
				N.keyframes=R(game:GetService("KeyframeSequenceProvider"));
				N.lp=N.players.LocalPlayer;
				N.hook=hookfunction or replaceclosure;
				N.newc=newcclosure or function(h)
					return h;
				end;
				N.getups=getupvalues or debug and debug.getupvalues;
				N.setup=setupvalue or debug and debug.setupvalue;
				N.info=debug and(debug.info or debug.getinfo);
				N.custom_asset=getcustomasset;
				local h=getthreadidentity or getidentity;
				local F=setthreadidentity or setidentity;
				N.identity=(function()
					if type(h)~="function"then 
						return nil;
					end;
					local t,f=pcall(h);
					if t then 
						if type(f)=="number"then 
							return f;
						end;
					end;
					return nil;
				end)();
				N.reclaim=function()
					if type(F)=="function"then 
						if N.identity then 
							pcall(F,N.identity);
						end;
					end;
				end;
				N.elevate=function(t,f,l,g,u)
					if type(F)~="function"then 
						return pcall(t,f,l,g,u);
					end;
					local s;
					if type(h)=="function"then 
						local C,z=pcall(h);
						s=if C then if type(z)=="number"then z else s else s;
					else 
					end;
					pcall(F,N.identity or 8);
					local C,z=pcall(t,f,l,g,u);
					if s then 
						pcall(F,s);
					end;
					return C,z;
				end;
				N.plain=function(t,...)
					if type(F)~="function"then 
						return pcall(t,...);
					end;
					local f=N.identity;
					if type(h)=="function"then 
						local l,g=pcall(h);
						f=if l then if type(g)=="number"then g else f else f;
					else 
					end;
					pcall(F,2);
					local h=table.pack(pcall(t,...));
					if f then 
						pcall(F,f);
					end;
					return table.unpack(h,1,h.n);
				end;
				N.host=(function()
					if type(gethui)=="function"then 
						local h,F=pcall(gethui);
						if h then 
							if typeof(F)=="Instance"then 
								return R(F);
							end;
						end;
					end;
					local h,F=pcall(game.GetService,game,"CoreGui");
					if h then 
						if typeof(F)=="Instance"then 
							return R(F);
						end;
					end;
					return N.lp:FindFirstChildOfClass("PlayerGui");
				end)();
				N.screen=function(R)
					local h=Instance.new("ScreenGui");
					h.IgnoreGuiInset=true;
					h.ResetOnSpawn=false;
					h.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;
					h.DisplayOrder=R or 0;
					R=pcall(function()
						h.Parent=N.host;
					end);
					if R then 
					else 
						local F=N.lp:FindFirstChildOfClass("PlayerGui");
						R=F~=nil and pcall(function()
							h.Parent=F;
						end);
					end;
					if R then 
						if not(h.Parent)then 
							h:Destroy();
							return nil;
						end;
					else 
						h:Destroy();
						return nil;
					end;
					return h;
				end;
				N.weak=function()
					return setmetatable({},{__mode="k"});
				end;
				N.module=function(R,...)
					local h=R or N.storage;
					for R=1,select("#",...),1 do 
						h=h:FindFirstChild((select(R,...)));
						if not(h)then 
							return nil;
						end;
					end;
					if not(h:IsA("ModuleScript"))then 
						return nil;
					end;
					local R,F=pcall(require,h);
					if R then 
						return F;
					end;
					return nil;
				end;
				N.drawmask=function()
					local R=rawget(_,"shitaro_drawmask");
					if type(R)=="table"then 
						return R;
					end;
					return nil;
				end;
				return N;
			end;
			K.c=function()
				local R=bit32.band;
				local _=bit32.bxor;
				local N=bit32.bnot;
				local h=bit32.rrotate;
				local F=bit32.rshift;
				local t=string.char;
				local f=string.byte;
				local l=string.rep;
				local g=string.sub;
				local u=string.gsub;
				local s=string.format;
				local C=table.concat;
				local z=table.create;
				local q=math.floor;
				local r,x=request or syn and syn.request or http and http.request or fluxus and fluxus.request or http_request,{1116352408,1899447441,3049323471,3921009573,961987163,1508970993,2453635748,2870763221,3624381080,310598401,607225278,1426881987,1925078388,2162078206,2614888103,3248222580,3835390401,4022224774,264347078,604807628,770255983,1249150122,1555081692,1996064986,2554220882,2821834349,2952996808,3210313671,3336571891,3584528711,113926993,338241895,666307205,773529912,1294757372,1396182291,1695183700,1986661051,2177026350,2456956037,2730485921,2820302411,3259730800,3345764771,3516065817,3600352804,4094571909,275423344,430227734,506948616,659060556,883997877,958139571,1322822218,1537002063,1747873779,1955562222,2024104815,2227730452,2361852424,2428436474,2756734187,3204031479,3329325298};
				local G=z(64,0);
				local function a(m)
					return t(q(m/16777216)%256,q(m/65536)%256,q(m/256)%256,m%256);
				end;
				local function m(c)
					local n=#c;
					local O,j=n*8%4294967296,q(n*8/4294967296);
					c..="\128"..l("\0",(56-(n+1)%64)%64)..a(j)..a(O);
					local E,P,T,Y,v,Z,L,o=1779033703,3144134277,1013904242,2773480762,1359893119,2600822924,528734635,1541459225;
					for X=1,#c,64 do 
						for Q=0,15,1 do 
							O=X+Q*4;
							G[Q+1]=f(c,O)*16777216+f(c,O+1)*65536+f(c,O+2)*256+f(c,O+3);
						end;
						for c=17,64,1 do 
							n,j=G[c-15],G[c-2];
							local O,X=_(h(n,7),h(n,18),F(n,3)),_(h(j,17),h(j,19),F(j,10));
							G[c]=(G[c-16]+O+G[c-7]+X)%4294967296;
						end;
						local F,c,n,O,j,X,Q,S=v,Z,L,o,E,P,T,Y;
						for A=1,64,1 do 
							local J,y=_(h(F,6),h(F,11),h(F,25)),_(R(F,c),R(N(F),n));
							local N,e=(O+J+y+x[A]+G[A])%4294967296,(_(h(j,2),h(j,13),h(j,22))+_(R(j,X),R(j,Q),R(X,Q)))%4294967296;
							F,O,j,S,c,n,X,Q=(S+N)%4294967296,n,(N+e)%4294967296,Q,F,c,j,X;
						end;
						E,P,T,Y,v,Z,L,o=(E+j)%4294967296,(P+X)%4294967296,(T+Q)%4294967296,(Y+S)%4294967296,(v+F)%4294967296,(Z+c)%4294967296,(L+n)%4294967296,(o+O)%4294967296;
					end;
					return a(E)..a(P)..a(T)..a(Y)..a(v)..a(Z)..a(L)..a(o);
				end;
				local R=z(64,"");
				local N=z(64,"");
				local function h(F,x)
					F=if#F>64 then m(F)else F;
					F=if#F<64 then F..l("\0",64-#F)else F;
					for G=1,64,1 do 
						local a=f(F,G);
						R[G]=t(_(a,92));
						N[G]=t(_(a,54));
					end;
					return m(C(R)..m(C(N)..x));
				end;
				local R={};
				for N=1,64,1 do 
					R[g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",N,N)]=N-1;
				end;
				local function N(F)
					local x,G={},0;
					for a=1,#F,3 do 
						local c,n,O=f(F,a),f(F,a+1),f(F,a+2);
						a=c*65536+(n or 0)*256+(O or 0);
						local F,j=q(a/262144)+1,q(a/4096)%64+1;
						G+=1;
						x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",F,F);
						G+=1;
						x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",j,j);
						if n then 
							j=q(a/64)%64+1;
							G+=1;
							x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",j,j);
						else 
						end;
						if O then 
							c=a%64+1;
							G+=1;
							x[G]=g("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_",c,c);
						else 
						end;
					end;
					return C(x);
				end;
				local function F(x)
					x=u(u(u(x,"-","+"),"_","/"),"[^A-Za-z0-9+/=]","");
					x..=l("=",(4-#x%4)%4);
					local l,G={},0;
					for a=1,#x,4 do 
						local c,n=g(x,a+2,a+2),g(x,a+3,a+3);
						local O=(R[g(x,a,a)]or 0)*262144+(R[g(x,a+1,a+1)]or 0)*4096+(R[c]or 0)*64+(R[n]or 0);
						G+=1;
						l[G]=t(q(O/65536)%256);
						if c~="="then 
							G+=1;
							l[G]=t(q(O/256)%256);
						else 
						end;
						if n~="="then 
							G+=1;
							l[G]=t(O%256);
						else 
						end;
					end;
					return C(l);
				end;
				local R=u("02d417c2bd7b033a00d3c4e9fda43fc56761f68f516cf68a68a6110f2cb99e49","..",function(l)
					return t(tonumber(l,16));
				end);
				local l=Random.new(os.time()+q(os.clock()*1000000)%2147483647);
				local function g()
					local x=z(16);
					for G=1,16,1 do 
						x[G]=t(l:NextInteger(0,255));
					end;
					return C(x);
				end;
				local function l(x)
					local G=z(8);
					for z=8,1,-1 do 
						G[z]=t(x%256);
						x=q(x/256);
					end;
					return C(G);
				end;
				local function z(q)
					return(u(q,"[^%w%-%._~/]",function(q)
						return s("%%%02X",f(q));
					end));
				end;
				local q=bit32.lshift;
				local x=bit32.rshift;
				local G=bit32.band;
				local function a(c)
					local function n(O)
						local j,E,P,T=f(c,O,O+3);
						return T*16777216+P*65536+E*256+j;
					end;
					local c=n(1);
					local O=n(5);
					local j=n(9);
					local E=n(13);
					local n,P,T,Y;
					if c==0 and O==0 and j==0 and E==0 then 
						c,O,j,E=2654435769,608135816,3084996962,2246822507;
						n,P,T,Y=c,O,j,E;
					else 
						n,P,T,Y=c,O,j,E;
					end;
					local function c()
						local O=_(n,q(n,11));
						O,n,P,T=_(O,x(O,8)),P,T,Y;
						local q=_(_(Y,x(Y,19)),O);
						Y=q;
						return q;
					end;
					return c;
				end;
				local function q(c,n)
					local O,j=a(h(R,"SHITARO-ASSET-MASK-v1\0"..n)),#c;
					if buffer and buffer.fromstring then 
						local a,E=buffer.fromstring(c),0;
						while E+4<=j do 
							buffer.writeu32(a,E,_(buffer.readu32(a,E),O()));
							E+=4;
						end;
						if E<j then 
							local P,T=O(),0;
							while E+T<j do 
								buffer.writeu8(a,E+T,_(buffer.readu8(a,E+T),G(x(P,T*8),255)));
								T+=1;
							end;
						end;
						return buffer.tostring(a);
					end;
					local a,E,P={},1,0;
					while E<=j do 
						n=O();
						for O=0,3,1 do 
							if E+O<=j then 
								P+=1;
								a[P]=t(_(f(c,E+O),G(x(n,O*8),255)));
							else 
							end;
						end;
						E=E+4;
					end;
					return C(a);
				end;
				local function _(t,C,x,G)
					if not(r)then 
						return nil;
					end;
					local a,c=g(),l(os.time());
					local g={["X-Shitaro-Token"]=N(a..c..h(R,"SHITARO-"..C.."-REQ-v1\0"..x.."\0"..a.."\0"..c)),Accept="*/*",["Cache-Control"]="no-cache"};
					if G then 
						g["Content-Type"]="application/json";
					end;
					local N,c=pcall(r,{Url=t,Method=G and"POST"or"GET",Headers=g,Body=G});
					if N then 
						if type(c)~="table"then 
							return nil;
						end;
					else 
						return nil;
					end;
					if c.StatusCode~=200 then 
						return nil,nil,c.StatusCode;
					end;
					G=c.Body;
					if type(G)~="string"then 
						return nil;
					elseif#G==0 then 
						return nil;
					end;
					N=c.Headers or{};
					t=N["X-Shitaro-Sig"]or N["x-shitaro-sig"];
					if t then 
						if t==""then 
							return nil;
						end;
					else 
						return nil;
					end;
					N=h(R,"SHITARO-"..C.."-RESP-v1\0"..x.."\0"..a.."\0"..l(#G)..G);
					if F(t)~=N then 
						return nil;
					end;
					return G,a;
				end;
				local function R(N)
					return(u(N,".",function(N)
						return s("%02x",f(N));
					end));
				end;
				return{library=function(N)
					for h=1,3,1 do 
						h=_("https://shitaro.lol/api/library/"..z(N),"LIB",N);
						if type(h)=="string"then 
							if#h>0 then 
								return h;
							end;
						end;
						task.wait(0.5);
					end;
					return nil;
				end,asset=function(N)
					local h,F=_("https://shitaro.lol/api/assets/"..z(N),"ASSET",N);
					if type(h)~="string"then 
						return nil;
					elseif#h==0 then 
						return nil;
					end;
					return q(h,F);
				end,share_put=function(N)
					local h,F,F=_("https://shitaro.lol/api/share","CFGPUT",R(m(N)),N);
					if type(h)~="string"then 
						return nil,F;
					end;
					F=string.match(h,"\"code\"%s*:%s*\"([%w%-]+)\"");
					if not F then 
						return nil,0;
					end;
					return F;
				end,share_get=function(R)
					R=string.upper(u(R,"[^%w%-]",""));
					if#R<4 then 
						return nil,404;
					elseif#R>16 then 
						return nil,404;
					end;
					local N,h,h=_("https://shitaro.lol/api/share/"..R,"CFGGET",R);
					if type(N)~="string"then 
						return nil,h;
					end;
					return N;
				end};
			end;
			K.d=function()
				local function R(_)
					return cloneref(game:GetService(_));
				end;
				local _,N=R("Players"),R("RunService");
				local h=R("UserInputService");
				local F=R("TweenService");
				local t=R("HttpService");
				local f=R("GuiService");
				local l=R("ReplicatedStorage");
				local g=R("Lighting");
				local u=R("Stats");
				local s,C,z,q,r,x,G,a,m=_.LocalPlayer,N,h,F,t,f,l,g,u;
				local N=s;
				local h=Color3.fromRGB;
				local F=Color3.fromHSV;
				local t=Color3.new;
				local f=UDim2.new;
				local l=UDim2.fromOffset;
				local g=UDim2.fromScale;
				local u=UDim.new;
				local s=Vector2.new;
				local c=ColorSequence.new;
				local n=ColorSequenceKeypoint.new;
				local O=NumberSequence.new;
				local j=NumberSequenceKeypoint.new;
				local E=math.clamp;
				local P=math.floor;
				local T=math.max;
				local Y=math.min;
				local v=math.abs;
				local Z=string.format;
				local L=string.sub;
				local o=string.upper;
				local X=string.lower;
				local Q=string.gsub;
				local S=string.match;
				local A=string.find;
				local J=table.find;
				local y=table.remove;
				local e=table.clear;
				local M=table.concat;
				local I=table.sort;
				local i=table.clone;
				local k=task.spawn;
				local B=task.delay;
				local d=task.defer;
				local b=Enum.TextXAlignment;
				local p=Enum.AutomaticSize.X;
				local D=Enum.AutomaticSize.Y;
				local V=Enum.AutomaticSize.XY;
				local W=Enum.AutomaticSize.None;
				local H=Enum.HorizontalAlignment;
				local w=Enum.VerticalAlignment;
				local UQ=Enum.TextTruncate.AtEnd;
				local KQ=Enum.UserInputType.MouseButton1;
				local RQ=Enum.UserInputType.MouseButton2;
				local _Q=Enum.UserInputType.MouseButton3;
				local NQ=Enum.UserInputType.MouseMovement;
				local hQ=Enum.UserInputType.Touch;
				local FQ=Enum.UserInputState.End;
				local tQ=Enum.KeyCode.Unknown;
				local fQ=Enum.PlaybackState.Completed;
				local lQ=Enum.EasingStyle.Quint;
				local gQ=Enum.EasingStyle.Quad;
				local uQ=Enum.EasingStyle.Sine;
				local sQ=t(1,1,1);
				local CQ=t(0,0,0);
				local zQ,qQ,rQ,xQ=getgenv(),base64encode,base64decode,{};
				xQ.__index=xQ;
				xQ.new=function()
					return setmetatable({},xQ);
				end;
				xQ.add=function(GQ,aQ)
					GQ[#GQ+1]=aQ;
					return aQ;
				end;
				xQ.clean=function(GQ)
					for aQ=#GQ,1,-1 do 
						local mQ=GQ[aQ];
						GQ[aQ]=nil;
						aQ=typeof(mQ);
						if aQ=="RBXScriptConnection"then 
							mQ:Disconnect();
						elseif aQ=="Instance"then 
							mQ:Destroy();
						elseif aQ=="function"then 
							pcall(mQ);
						elseif aQ=="thread"then 
							pcall(task.cancel,mQ);
	
