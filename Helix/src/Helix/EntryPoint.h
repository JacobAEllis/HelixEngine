#pragma once

#ifdef HX_PLATFORM_WINDOWS

extern Helix::Application* Helix::CreateApplication();

int main(int argc, char** argv)
{
	Helix::Log::Init();
	HX_CORE_WARN("Initialized Logging System");
	int a = 5;
	HX_INFO("Hello! Var={0}", a);

	auto app = Helix::CreateApplication();
	app->Run();
	delete app;
}

#endif
