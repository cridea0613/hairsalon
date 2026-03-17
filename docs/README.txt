1️⃣ PROJECT_CONTEXT.md
역할

프로젝트 전체의 기본 규칙과 기술 방향을 설명하는 문서

AI가 프로젝트를 이해하는 가장 중요한 문서입니다.

포함 내용

프로젝트 목적

기술 스택

폴더 구조

개발 원칙

성능 목표

SEO 기준

접근성 기준

AI 작업 규칙

쉽게 말하면
프로젝트의 헌법

AI는 항상 이 문서를 기준으로 작업해야 합니다.

2️⃣ DESIGN_SYSTEM.md
역할

사이트의 디자인 규칙을 정의하는 문서

AI가 UI를 만들 때 일관된 스타일을 유지하도록 하는 역할을 합니다.

포함 내용

타이포그래피

spacing 시스템

색상 규칙

radius 규칙

shadow 규칙

레이아웃 기준

쉽게 말하면
디자인 스타일 가이드

AI가 매번 다른 디자인을 만들지 않도록 막는 문서입니다.

3️⃣ SEO_RULES.md
역할

웹사이트의 검색엔진 최적화 규칙을 정의하는 문서

AI가 HTML을 생성할 때 SEO 구조를 깨지 않도록 하는 역할을 합니다.

포함 내용

title 규칙

meta description

heading 구조

structured data

image SEO

sitemap / robots 규칙

쉽게 말하면
SEO 체크리스트

AI가 SEO를 망치지 않도록 하는 문서입니다.

4️⃣ AI_PROMPT_LIBRARY.md
역할

바이브코딩에서 사용하는 프롬프트 모음

AI에게 반복적으로 사용할 명령어들을 정리한 문서입니다.

포함 내용

예를 들어

HTML 구조 생성 프롬프트

CSS 생성 프롬프트

JS 기능 생성 프롬프트

SEO 점검 프롬프트

쉽게 말하면
AI 명령어 모음집

개발 속도를 크게 높여줍니다.

5️⃣ COMPONENT_LIBRARY.md
역할

웹사이트에서 사용하는 UI 컴포넌트를 정의하는 문서

AI가 새로운 UI를 계속 만들지 않고
기존 컴포넌트를 재사용하도록 만드는 역할을 합니다.

포함 컴포넌트

Navigation Header

Hero Section

Feature Card

CTA Section

FAQ

Button

Card

Footer

Grid System

쉽게 말하면
UI 부품 창고

AI가 같은 UI를 계속 새로 만들지 않게 합니다.


------------------------------------------------------------------

🤖 AI에게 작업을 맡길 때 사용하는 기본 명령어

AI에게 작업을 시킬 때는 항상 문서를 먼저 읽게 해야 합니다.

추천 명령어:

Read these project documents first:

PROJECT_CONTEXT.md
DESIGN_SYSTEM.md
SEO_RULES.md
COMPONENT_LIBRARY.md

Follow all rules defined in these documents.

Then generate the HTML, CSS, and JavaScript code for the requested page.
🔧 페이지 생성 요청 예시

예를 들어 메인페이지를 만들고 싶다면

Read these project documents first:

PROJECT_CONTEXT.md
DESIGN_SYSTEM.md
SEO_RULES.md
COMPONENT_LIBRARY.md

Create a semantic HTML homepage.

Requirements:

- SEO-friendly structure
- accessible markup
- use the components defined in COMPONENT_LIBRARY.md
- follow the design system
- mobile-first layout

Return HTML, CSS, and minimal JavaScript if needed.
🔧 컴포넌트 생성 요청 예시
Read COMPONENT_LIBRARY.md and DESIGN_SYSTEM.md.

Create a reusable feature card component.

Requirements:

- follow design system spacing
- use consistent border radius
- keep clean semantic HTML
- minimal CSS
🔧 SEO 점검 요청 예시
Read SEO_RULES.md.

Audit this HTML page for SEO issues.

Check:

- heading hierarchy
- missing meta tags
- accessibility problems
- structured data opportunities
🚀 이 구조의 장점

이 문서 구조를 사용하면

AI가 프로젝트를 이해함

디자인 일관성 유지

SEO 깨짐 방지

UI 중복 생성 방지

코드 품질 향상

개발 속도 증가

즉 AI와 협업하는 개발 환경을 만들 수 있습니다.
